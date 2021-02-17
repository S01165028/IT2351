-- ***************************************************************************************************************************************************
-- IT2351 Assignment 2 Part 2g - Ryan Halter
-- ***************************************************************************************************************************************************
-- A 4-way join is used for customers and items.
-- The orders and order_details are joined together with order_id, the primary key of the orders table
-- In addition, items is joined with order_details by item_id
-- Customers is joined with orders by the customer_id fieldcustomerscustomers
SELECT concat(customer_first_name, " ", customer_last_name), title
FROM orders o INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN items i ON i.item_id = od.item_id
INNER JOIN customers c ON c.customer_id = o.customer_id
WHERE customer_state = "OH"