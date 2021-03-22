/********************************************************
* Ryan Halter Assignment 4 Number 3
*********************************************************/

SELECT list_price, discount_percent, ROUND(list_price * (discount_percent/100), 2) "discount_amount"
FROM products