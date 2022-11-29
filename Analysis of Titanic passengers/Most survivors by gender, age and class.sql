SELECT
	sex || ' ' ||
	CASE
		WHEN age < 18 then 'children'
        when age >= 18 then 'adults'
    END || ', Class ' ||
    pclass as group_of_people, 
    COUNT(*) AS number_of_survivors from mytable
where group_of_people is not NULL
GROUP BY group_of_people
ORDER by number_of_survivors DESC;
