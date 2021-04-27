/********************************************************
* Ryan Halter Assignment 7 Number 3
*********************************************************/

DROP PROCEDURE IF EXISTS test2; /*This serves to prevent duplicate procedures*/

DELIMITER //
/*The DELIMETER is used to make the procedure treated as one instruction instead of several*/

CREATE PROCEDURE test2()
BEGIN /*The start of the procedure*/
  DECLARE sql_error TINYINT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE; /*sql_error is created to be used later on for error handling*/

  START TRANSACTION; /*The start of the actual transaction*/
  
  
  DELETE FROM invoice_line_items /*Deletes references to the invoice, allowing it to be deleted safely.*/
  WHERE invoice_id = 114;

  DELETE FROM invoices /*Deletes the invoice*/
  WHERE invoice_id = 114;

  IF sql_error = FALSE THEN /*Checks to see if there has been an error*/
    COMMIT; /*Should no error have occured, the changes will be "commited", or saved*/
    SELECT 'The transaction succeeded and has been committed.';
  ELSE
    ROLLBACK; /*Otherwise the changes will be rolled back, allowing the developer to fix the code and try again*/
    SELECT 'The transaction failed and has been rolled back.';
  END IF;
END//

DELIMITER ;

CALL test2();