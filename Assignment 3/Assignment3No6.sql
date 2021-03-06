/********************************************************
* Ryan Halter Assignment 3 Number 6
*********************************************************/

SELECT email_address, o.order_id, SUM(quantity * (item_price - discount_amount)) "Order Total"
FROM customers c INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY email_address, order_id