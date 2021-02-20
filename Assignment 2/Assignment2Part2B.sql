-- ***************************************************************************************************************************************************
-- IT2351 Assignment 2 Part 2b - Ryan Halter
-- ***************************************************************************************************************************************************
-- Customers and orders are joined together using the customer_id field, a primary key for customers and a foreign key for orders.
SELECT concat(customer_first_name, " ", customer_last_name), customer_city, customer_state, order_date, shipped_date
FROM orders o INNER JOIN customers c ON c.customer_id = o.customer_id
ORDER BY customer_state, customer_city, customer_last_name, customer_first_name