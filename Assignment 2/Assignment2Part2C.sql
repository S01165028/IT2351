-- ***************************************************************************************************************************************************
-- IT2351 Assignment 2 Part 2c - Ryan Halter
-- ***************************************************************************************************************************************************
-- The two tables are joined together with order_id, the primary key of the orders table
SELECT customer_id, order_date, item_id, order_qty
FROM orders o INNER JOIN order_details od ON o.order_id = od.order_id