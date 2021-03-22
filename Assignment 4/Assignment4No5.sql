/********************************************************
* Ryan Halter Assignment 4 Number 5
*********************************************************/

SELECT category_name, product_name, SUM(quantity) "total_sales",
FIRST_VALUE(product_name) OVER (PARTITION BY category_name ORDER BY SUM(quantity) DESC) "highest_sales",
LAST_VALUE(product_name) OVER (PARTITION BY category_name ORDER BY SUM(quantity) DESC RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) "lowest_sales"
FROM categories c INNER JOIN products p ON c.category_id = p.category_id
INNER JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY product_name