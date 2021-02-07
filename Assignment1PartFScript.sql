-- ***************************************************************************************************************************************************
-- IT2351 Assignment 1 Part 3f - Ryan Halter
-- ***************************************************************************************************************************************************
SELECT orders.customer_id, orders.order_date, orders.shipped_date, datediff(shipped_date, order_date) "Days_to_Ship"
FROM orders
ORDER BY customer_id, Days_to_Ship