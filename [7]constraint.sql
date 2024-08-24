-- UNIQUE Constraint

CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);
 
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');
 
-- This insert would result in an error:
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');

-- CHECK Constraint

CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);
 
CREATE TABLE palindromes (
  word VARCHAR(100) CHECK(REVERSE(word) = word)
);

-- NAMED Constraint

CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);
 
CREATE TABLE palindromes2 (
  word VARCHAR(100),
  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);

-- Multiple column constraint

CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);
 
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);

-- ALTERE TABLE - adding columns 

ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);
 
ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

-- ALTER TABLE dropping column

ALTER TABLE companies DROP COLUMN phone;

-- ALTER TABLE - renaming

RENAME TABLE companies to suppliers;


ALTER TABLE suppliers RENAME TO companies;


ALTER TABLE companies
RENAME COLUMN name TO company_name;

-- ALTER TABLE - modifying column properties

ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';


ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);

-- ALTER TABLE adding/modifying Constraints

ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);


ALTER TABLE houses DROP CONSTRAINT positive_pprice;

-- SECTION CHALLENGE

-- [1] CREATE A TABLE
CREATE TABLE users3(
	given_name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

-- [2] ADD contact column
ALTER TABLE users3 ADD COLUMN contact VARCHAR(15) NOT NULL;

-- [3] ADD constraint SET contact as UNIQUE
ALTER TABLE users3 
ADD CONSTRAINT set_contact_unique UNIQUE (contact);

-- [4] add constraint to age should be 18 above
ALTER TABLE users3
ADD CONSTRAINT set_age_18 CHECK (age >= 18);
DESC users3;

-- [5] alter given name 
ALTER TABLE users3
RENAME COLUMN given_name TO name;

-- [6] change table name
ALTER TABLE users3 RENAME TO users4;
DESC users4;

-- [7] change age property from INT to small INT
ALTER TABLE users4
MODIFY age SMALLINT CHECK(age >= 18);

INSERT INTO users4(name, age, contact)
VALUES('sam', 13, 09158320509);
INSERT INTO users4(name, age, contact)
VALUES('kaleb', 18, 09158320509);
