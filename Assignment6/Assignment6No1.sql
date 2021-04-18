/********************************************************
* Ryan Halter Assignment 6 Number 1
*********************************************************/

DROP PROCEDURE IF EXISTS productCount;

DELIMITER //

CREATE PROCEDURE productCount()
BEGIN
	DECLARE product_sum INT;

	SELECT COUNT(*)
    FROM products
    INTO product_sum;
    
    IF product_sum >= 20 THEN
		SELECT 'The number of products is greater than or equal to 20' AS message;
	ELSE
		SELECT 'The number of products is less than 20' AS message;
	END IF;
END//

DELIMITER ;

CALL productCount();