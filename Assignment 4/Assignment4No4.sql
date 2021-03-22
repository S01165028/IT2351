/********************************************************
* Ryan Halter Assignment 4 Number 4
*********************************************************/

SELECT order_id, order_date, ADDDATE(order_date, 2) "approx_ship_date", IFNULL(ship_date, ""), DATEDIFF(ship_date, order_date) "days_to_ship"
FROM orders
WHERE MONTH(order_date) = 3 AND YEAR(order_date) = 2018