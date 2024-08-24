use books_db;

INSERT INTO books
(title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('10% happier', 'Dan', 'Harris', 2014, 29, 256),
('fake_book', 'Freida', 'Harris', 2001, 287, 428),
('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
DESC books;

SELECT * FROM books;

SELECT DISTINCT title FROM books;
SELECT COUNT(DISTINCT title) FROM books;

SELECT author_lname FROM books;
SELECT COUNT(author_lname) FROM books;

SELECT DISTINCT author_lname FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;

SELECT DISTINCT title, author_lname, author_fname FROM books;

SELECT * FROM books
ORDER BY author_lname;
 
SELECT * FROM books
ORDER BY author_lname DESC;
 
SELECT * FROM books
ORDER BY released_year;

SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY 2 desc; /*order by the second thing in the select which is fname*/
 
SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY author_lname, author_fname;
/*used in case of same lname but different fname*/

SELECT title FROM books LIMIT 3;
 
SELECT title FROM books LIMIT 1;
 
SELECT title FROM books ORDER BY title LIMIT 10;
SELECT title FROM books ORDER BY title LIMIT 2, 10;
 
SELECT * FROM books LIMIT 1;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 5;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 14;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,5;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,3;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1,3;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 10,1;
 
SELECT * FROM tbl LIMIT 95,18446744073709551615;
 
SELECT title FROM books LIMIT 5;
 
SELECT title FROM books LIMIT 0, 123219476457;
 
SELECT title FROM books LIMIT 5, 50;

SELECT title, author_fname, author_lname, pages 
FROM books
WHERE author_fname LIKE '%da%';
 
SELECT title, author_fname, author_lname, pages 
FROM books
WHERE title LIKE '%:%';
 
SELECT * FROM books
WHERE author_fname LIKE '____';/*four lettered fname*/
 
SELECT * FROM books
WHERE author_fname LIKE '_a_';

SELECT * FROM books
WHERE title LIKE '%\%%';
 
-- To select books with an underscore '_' in title:
SELECT * FROM books
WHERE title LIKE '%\_%';

-- section challenge
SELECT title FROM books WHERE title LIKE '%stories%';

SELECT title, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);

SELECT CONCAT(title,  ' - ',  released_year) AS 'summary' 
FROM books ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname FROM books WHERE author_lname LIKE '%\ %';

SELECT title, released_year, stock_quantity 
FROM books ORDER BY stock_quantity ASC LIMIT 3;

SELECT title, author_lname FROM books ORDER BY author_lname, title;

SELECT CONCAT('MY FAVORITE AUTHOR IS ', author_fname,' ', author_lname, '!' ) AS 'yell'
FROM books ORDER BY author_lname ASC;








