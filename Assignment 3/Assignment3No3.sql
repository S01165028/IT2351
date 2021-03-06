/********************************************************
* Ryan Halter Assignment 3 Number 3
*********************************************************/

SELECT category_name, count(*), max(p.list_price)
FROM categories c INNER JOIN products p ON c.category_id = p.category_id
GROUP BY category_name
ORDER BY count(*) desc