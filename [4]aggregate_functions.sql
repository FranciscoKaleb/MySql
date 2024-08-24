SELECT COUNT(*) FROM books;
SELECT COUNT(author_lname) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;

SELECT COUNT(*) FROM books
GROUP BY author_lname; 

SELECT author_lname, COUNT(*) FROM books
GROUP BY author_lname; 

SELECT author_lname, COUNT(*) AS books_written
FROM books
GROUP BY author_lname
ORDER BY books_written DESC;

SELECT author_lname, COUNT(*) AS books_written,
GROUP_CONCAT(title ORDER BY title SEPARATOR ', ') 
AS book_titles FROM books
GROUP BY author_lname ORDER BY books_written DESC;

SELECT MAX(pages) FROM books;
 
SELECT MIN(author_lname) FROM books;

SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);


SELECT MIN(released_year) FROM books;

SELECT * FROM books 
WHERE released_year = (SELECT MIN(released_year) FROM books);

SELECT author_fname, author_lname, COUNT(*) 
FROM books 
GROUP BY author_lname, author_fname ORDER BY author_lname, author_fname DESC;

SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*)
FROM books
GROUP BY author;

SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname;

SELECT author_lname, MAX(released_year), MIN(released_year) 
FROM books GROUP BY author_lname;

SELECT author_lname, COUNT(*) as books_written, 
MAX(released_year) AS latest_release,
MIN(released_year)  AS earliest_release,
MAX(pages) AS longest_page_count
FROM books GROUP BY author_lname;

SELECT author_lname, author_fname,
COUNT(*) as books_written, 
MAX(released_year) AS latest_release,
MIN(released_year)  AS earliest_release
FROM books GROUP BY author_lname, author_fname;

SELECT SUM(pages) FROM books;

SELECT author_lname, COUNT(*) AS 'book count', SUM(pages) 
FROM books GROUP BY author_lname ORDER BY COUNT(*) desc;

SELECT author_lname, COUNT(*), FORMAT(avg(pages), 2) FROM books
GROUP BY author_lname;

-- section exercise

SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) FROM books; 

SELECT CONCAT(author_fname, ' ',author_lname) AS 'Author' , AVG(released_year) FROM books
GROUP BY author_lname, author_fname;

SELECT CONCAT(author_fname, ' ' , author_lname) AS 'Author', title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT released_year, COUNT(*), AVG(pages) FROM books
GROUP BY released_year ORDER BY released_year ASC;



