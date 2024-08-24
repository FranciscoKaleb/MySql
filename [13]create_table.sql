CREATE DATABASE join_us_db;
USE join_us_db;
DROP TABLE users;
CREATE TABLE users (
	id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) ,
    created_at TIMESTAMP DEFAULT NOW()
);

TRUNCATE users;
SELECT * FROM users ORDER BY id DESC;
INSERT INTO users(email) VALUES('francisco34@gmail.com');

SELECT created_at, COUNT(*) FROM users GROUP BY created_at
ORDER BY COUNT(*) DESC;

-- earliest date a user joined

SELECT * FROM users ORDER BY created_at ASC LIMIT 1;
SELECT * FROM users ORDER BY created_at DESC LIMIT 1;

-- count users registered by month desc
SELECT MONTHNAME(created_at), COUNT(*) FROM users
GROUP BY MONTHNAME(created_at) ORDER BY COUNT(*) DESC;

-- count users with yahoo emails
SELECT COUNT(*) FROM users WHERE email LIKE '%yahoo.com';

-- COUNT how many subs for each provider
SELECT 
CASE
	WHEN email LIKE '%gmail.com' THEN 'gmail'
    WHEN email LIKE '%yahoo.com' THEN 'yahoo'
    WHEN email LIKE '%hotmail.com' THEN 'hotmail'
    ELSE 'other'
END AS provider,
COUNT(*) AS total_users
FROM users
GROUP BY provider;

SELECT COUNT(*) FROM users;



