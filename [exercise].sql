SELECT * FROM students_db2.STUDENTS;


-- Query the Name of any student in STUDENTS who scored higher than 75 Marks. 
-- Order your output by the last three characters of each name. 
-- If two or more students both have names ending in the same last three characters 
-- (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
USE students_db2;
SELECT last_name, student_name, marks FROM STUDENTS WHERE marks > 75 ORDER BY RIGHT(last_name, 3), id ASC;


-- Write a query that prints a list of employee names 
-- (i.e.: the name attribute) from the Employee table in 
-- alphabetical order.
USE Employee_db;
SELECT employee_name FROM Employee ORDER BY employee_name ASC;

-- Write a query that prints a list of employee names 
-- (i.e.: the name attribute) for employees in Employee 
-- having a salary greater than 20000 per month who have been 
-- employees for less than 10 months. Sort your result by 
-- ascending employee_id.

SELECT employee_name, salary, months 
FROM Employee WHERE months < 10 AND salary > 20000
ORDER BY salary ASC;

SELECT * FROM refcitymun;
SELECT * FROM refprovince;


SELECT refprovince.provDesc, 
CONCAT('There are ', COUNT(refcitymun.provCode), 
' cities and municipalities in ', provDesc)
FROM refcitymun JOIN refprovince 
ON refprovince.provCode = refcitymun.provCode  
GROUP BY refprovince.id ORDER BY COUNT(refcitymun.provCode) DESC;




