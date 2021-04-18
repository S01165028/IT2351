/********************************************************
* Ryan Halter Assignment 6 Number 2
*********************************************************/

DROP PROCEDURE IF EXISTS insertCategory;

DELIMITER //

CREATE PROCEDURE insertCategory()
BEGIN
	DECLARE category_count INT;
    DECLARE category VARCHAR(255);
    SET category = "Guitars";

	SELECT COUNT(*)
    FROM categories
    WHERE category_name = category
    INTO category_count;
    
    SELECT category_count;
    
    IF category_count = 0 THEN
		INSERT INTO categories (category_name)
		VALUES (category);
		SELECT '1 row was inserted.' AS message;
	ELSE
		SELECT 'Row was not inserted - duplicate entry.' AS message;
	END IF;
END//

DELIMITER ;

CALL insertCategory();