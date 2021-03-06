/********************************************************
* Ryan Halter Assignment 3 Number 4
*********************************************************/

SELECT IF(GROUPING(category_name) = 1, "Grand Total", category_name) CategoryName,
IF(GROUPING(product_name) = 1, "Total Purchased", product_name) ProductName, sum(quantity)
FROM categories c INNER JOIN products p ON c.category_id = p.category_id
INNER JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY category_name, product_name
WITH ROLLUP