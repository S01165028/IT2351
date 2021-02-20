-- ***************************************************************************************************************************************************
-- IT2351 Assignment 2 Part 2f - Ryan Halter
-- ***************************************************************************************************************************************************
-- order_details and items are joined together with the item_id field
SELECT title, order_qty
FROM items i INNER JOIN order_details od ON i.item_id = od.item_id
WHERE order_qty > 1