SELECT cabin as safest_cabins, pclass as class, average_fare, total_in_cabin as people_in_cabin, PRINTF('%2d%%', survived_in_cabin*100.0/total_in_cabin) as chance_of_survival from
  (SELECT 
      cabin,
   	  pclass,
      COUNT(*) as total_in_cabin,
   	  AVG(fare) as average_fare,
      (SELECT COUNT(*) WHERE survived = 1) as survived_in_cabin 
  from mytable
  WHERE cabin is not NULL
  GROUP by cabin)
WHERE total_in_cabin > 1
order by survived_in_cabin*1.0/total_in_cabin DESC, average_fare ASC
LIMIT 5;
