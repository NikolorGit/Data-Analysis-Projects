SELECT 
	name, 
    MAX(age) || ' years' as age, 
    pclass as class,
    sibsp+parch as number_of_relatives_on_board
FROM mytable
WHERE survived = 1
UNION
SELECT 
	name as youngest_survived_passenger, 
    MIN(age) || ' years' as age, 
    pclass as class,
    sibsp+parch as number_of_relatives_on_board
FROM mytable
WHERE survived = 1;
