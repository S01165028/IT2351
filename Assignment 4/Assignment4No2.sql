/********************************************************
* Ryan Halter Assignment 4 Number 1
*********************************************************/

SELECT email_address, LENGTH(email_address) "Length", LOCATE("@", email_address) "@", SUBSTRING(email_address, 1, LOCATE("@", email_address)-1) "Username",
SUBSTRING(email_address, LOCATE("@", email_address)+1) "Domain"
FROM customers