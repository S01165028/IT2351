/********************************************************
* Ryan Halter Assignment 5 Number 3
*********************************************************/

DROP VIEW items_ordered;

CREATE VIEW items_ordered AS
SELECT category_name, product_name, item_price, quantity
FROM products p INNER JOIN order_items oi ON p.product_id = oi.product_id
INNER JOIN categories c ON c.category_id = p.category_id;

SELECT *
FROM items_ordered