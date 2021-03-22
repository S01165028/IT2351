/********************************************************
* Ryan Halter Assignment 4 Number 6
*********************************************************/

CREATE VIEW order_item_products AS
SELECT o.order_id, order_date, tax_amount, ship_date, product_name, item_price, discount_amount, (item_price - discount_amount) "final_price", quantity,
(item_price-discount_amount)+tax_amount "item_total"
FROM orders o INNER JOIN order_items oi ON o.order_id= oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

SELECT *
FROM order_item_products