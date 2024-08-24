-- EXERCISE 1

-- SELECTING province with max name length and its length
SELECT MAX(provDesc), length(MAX(provDesc)) FROM refprovince;

-- SELECTING CITIES WITH Min and max length using union
SELECT provDesc, length(provDesc) FROM refprovince
WHERE length(provDesc) = (SELECT length(MAX(provDesc)) FROM refprovince) 
ORDER BY provDesc ASC;

SELECT provDesc, length(provDesc) FROM refprovince
WHERE length(provDesc) = (SELECT length(MIN(provDesc)) FROM refprovince) 
ORDER BY provDesc ASC;

(SELECT provDesc, length(provDesc) FROM refprovince
WHERE length(provDesc) = (SELECT length(MAX(provDesc)) FROM refprovince) 
ORDER BY provDesc ASC LIMIT 1)
UNION
(SELECT provDesc, length(provDesc) FROM refprovince
WHERE length(provDesc) = (SELECT length(MIN(provDesc)) FROM refprovince) 
ORDER BY provDesc ASC LIMIT 1);

-- Query the list of province names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT provDesc FROM refprovince WHERE LEFT(provDesc,1) IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');


-- query all names ending with letter a 
SELECT DISTINCT provDesc FROM refprovince WHERE RIGHT(provDesc,1) IN ('a');

-- Query the list of prov names from refprovince which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

SELECT DISTINCT provDesc FROM refprovince 
WHERE LEFT(provDesc,1) IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U') 
AND RIGHT(provDesc, 1) IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');

-- Query the list of provDesc names from refprovince that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT provDesc FROM refprovince WHERE LEFT(provDesc,1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');

-- not ending with vowels

SELECT DISTINCT provDesc FROM refprovince WHERE RIGHT(provDesc,1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');


-- Query the list of provDesc names from refprovince 
-- that either do not start with vowels 
-- OR
-- do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT provDesc FROM refprovince 
WHERE LEFT(provDesc,1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U') 
OR RIGHT(provDesc, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');

-- Query the list of provDesc names from refprovince
-- that do not start with vowels AND 
-- do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT provDesc FROM refprovince 
WHERE LEFT(provDesc,1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U') 
AND RIGHT(provDesc, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');


