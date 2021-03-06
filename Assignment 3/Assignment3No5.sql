/********************************************************
* Ryan Halter Assignment 3 Number 5
*********************************************************/

SELECT DISTINCT category_name
FROM categories c
WHERE EXISTS (SELECT category_name
FROM products p
WHERE p.category_id = c.category_id)
ORDER BY category_name