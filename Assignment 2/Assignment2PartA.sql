-- ***************************************************************************************************************************************************
-- IT2351 Assignment 2 Part 2a - Ryan Halter
-- ***************************************************************************************************************************************************
-- I'm using the item_id on the order_details table to join to the item_id of the items table
SELECT title, artist, unit_price, order_qty
FROM items i INNER JOIN order_details o ON i.item_id = o.item_id
ORDER BY title, artist