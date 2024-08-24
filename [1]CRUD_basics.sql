CREATE DATABASE shirts_db;
USE shirts_db;

CREATE TABLE shirts(
	shirts_id INT AUTO_INCREMENT,
    article VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL,
    shirt_size VARCHAR(10) NOT NULL,
    last_worn INT NOT NULL,
    PRIMARY KEY (shirts_id)
    
);
INSERT INTO shirts(article, color, shirt_size, last_worn)
VALUES
('t-shirt', 'white','S', 10 ),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);
INSERT INTO shirts(article, color, shirt_size, last_worn)
VALUES('polo shirt', 'Purple', 'M', 50);
SELECT * FROM shirts;
SELECT article, color FROM shirts;
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size = 'M';

UPDATE shirts SET shirt_size = 'L';

UPDATE shirts SET shirt_size = 'XS' WHERE color = 'white';

DELETE FROM shirts WHERE last_worn = 200;
DROP DATABASE shirts_db;
