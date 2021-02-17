-- ***************************************************************************************************************************************************
-- IT2351 Assignment 2 Part 2d - Ryan Halter
-- ***************************************************************************************************************************************************
-- The orders and order_details are joined together with order_id, the primary key of the orders table
-- In addition, items is joined with order_details by item_id
SELECT customer_id, order_date, artist, order_qty
FROM orders o INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN items i ON i.item_id = od.item_id