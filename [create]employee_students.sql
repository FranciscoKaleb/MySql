CREATE DATABASE students_db2;
USE students_db2;

DROP TABLE STUDENTS;
CREATE TABLE STUDENTS(
	id INT PRIMARY KEY auto_increment,
    last_name VARCHAR(100),
    student_name VARCHAR(100),
    marks tinyint
);


CREATE DATABASE Employee_db;
USE Employee_db;

CREATE TABLE Employee(
	id INT PRIMARY KEY auto_increment,
    employee_name VARCHAR(100),
    months smallint,
    salary int
);