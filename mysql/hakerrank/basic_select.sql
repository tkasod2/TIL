-- Revising the Select Query I
SELECT *
FROM CITY
WHERE POPULATION > 100000
AND COUNTRYCODE ='USA';

-- Revising the Select Query II
SELECT NAME
FROM CITY
WHERE POPULATION > 120000
AND COUNTRYCODE = 'USA';

-- Select All
SELECT * FROM CITY;

-- Select By ID
SELECT * FROM CITY
WHERE ID = 1661;

-- Japanese Cities' Attributes
SELECT * FROM CITY
WHERE COUNTRYCODE = 'JPN';

-- Japanese Cities' Names
SELECT NAME FROM CITY WHERE COUNTRYCODE = 'JPN';

-- Weather Observation Station 1
SELECT CITY, STATE FROM STATION;

-- Weather Observation Station 3
SELECT DISTINCT(CITY) FROM STATION
WHERE MOD(ID,2) = 0 ;-- EVEN

-- Weather Observation Station 4
SELECT COUNT(CITY)-COUNT(DISTINCT(CITY)) FROM STATION;

-- Weather Observation Station 5
(SELECT CITY,LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY) ASC, CITY ASC
LIMIT 1)
UNION
(SELECT CITY,LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY ASC
LIMIT 1);

-- Weather Observation Station 6
-- 첫글자가 모음으로 시작되는 경우
SELECT DISTINCT(CITY) FROM STATION
WHERE SUBSTR(CITY,1,1) in ('a','e','i','o','u');

-- Weather Observation Station 7
-- 끝글자가 모음으로 끝나는 경우
SELECT DISTINCT(CITY) FROM STATION
WHERE SUBSTR(CITY,-1) IN ('A','E','I','O','U');

-- Weather Observation Station 8
-- 첫, 끝 글자 모두가 모음인 경우
SELECT DISTINCT(CITY) FROM STATION
WHERE CITY REGEXP '^[aeiou].*[aeiou]$';

-- Weather Observation Station 9
-- 첫글자 모음 아닌경우
-- 방법1 정규표현식
SELECT DISTINCT(CITY) FROM STATION
WHERE CITY REGEXP '^[^aeiou]';
-- 방법2 IN
SELECT DISTINCT(CITY) FROM STATION
WHERE SUBSTR(CITY,1,1) NOT IN ('a','e','i','o','u');

-- Weather Observation Station 10
SELECT DISTINCT(CITY) FROM STATION
WHERE CITY REGEXP '[^aeiou]$';

-- Weather Observation Station 11
-- regexp or문 |
SELECT distinct(CITY) FROM STATION
WHERE CITY REGEXP '^[^aeiou]|[^aeiou]$';

-- Weather Observation Station 12
-- regexp and문 .*
SELECT distinct(CITY) FROM STATION
WHERE CITY REGEXP '^[^aeiou].*[^aeiou]$';

-- Higher Than 75 Marks
SELECT Name FROM STUDENTS
WHERE Marks > 75
ORDER BY SUBSTR(Name,-3) ASC, ID ASC;

-- Employee Names
SELECT name FROM Employee
ORDER BY name;

-- Employee Salaries
SELECT name FROM Employee
WHERE salary > 2000
AND months < 10
ORDER BY employee_id;



