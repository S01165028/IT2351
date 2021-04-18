/********************************************************
* Ryan Halter Assignment 6 Number 3
*********************************************************/

DELIMITER //

CREATE FUNCTION discount_price (truePrice INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE discountPrice DECIMAL(10,2);
    
    SELECT (item_price - discount_amount) INTO discountPrice
    FROM order_items
    WHERE item_id = truePrice;
    
    RETURN (discountPrice);
END//

DELIMITER ;