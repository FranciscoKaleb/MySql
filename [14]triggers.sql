USE instagram_clone;

-- create trigger
DELIMITER $$

CREATE TRIGGER must_be_adult
			-- run trigger before anything is inserted in the users table
BEFORE INSERT ON users
FOR EACH ROW
BEGIN 
    IF TIMESTAMPDIFF(MONTH, NEW.birthday, NOW()) < 216 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Must be over 18';
    END IF;
END$$

DELIMITER ;

-- try inserting over 18
INSERT INTO users(username, birthday)
VALUES('Eugene81989','2010-11-05');


-- remove trigger

DROP TRIGGER must_be_adult; 
