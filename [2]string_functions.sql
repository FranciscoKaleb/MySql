CREATE DATABASE books_db;
USE books_db;

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343.333);


SELECT * FROM books;
SELECT lower(title) FROM books;
SELECT upper(title) FROM books;
SELECT LPAD(title,50,'***') FROM books; /*this a comment*/

SELECT DISTINCT title  FROM books WHERE title LIKE BINARY '%The%';
SELECT DISTINCT title  FROM books WHERE title LIKE '%The%';

/*Match beginning of string(^): Gives all the names starting with 'Ca' */
SELECT title FROM books WHERE title REGEXP '^Ca'; 

/*Match the title ending with 's' */
SELECT title FROM books WHERE title REGEXP 's$';

/**/
SELECT DISTINCT title FROm books WHERE title REGEXP 'th ?';

/*matches any of the patterns p1, p2, or p3(p1|p2|p3):*/
SELECT DISTINCT title FROm books WHERE title REGEXP 'th|ae';

SELECT DISTINCT title FROm books WHERE title REGEXP '[s]';

SELECT REVErse(title) FROM books;