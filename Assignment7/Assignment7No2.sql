/********************************************************
* Ryan Halter Assignment 7 Number 2
*********************************************************/

DROP PROCEDURE IF EXISTS test; /*This serves to prevent duplicate procedures*/

DELIMITER // /*The DELIMETER is used to make the procedure treated as one instruction instead of several*/

CREATE PROCEDURE test()
BEGIN /*The start of the procedure*/
  DECLARE sql_error TINYINT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE; /*sql_error is created to be used later on for error handling*/

  START TRANSACTION; /*The start of the actual transaction*/
  
  
  UPDATE invoices
  SET vendor_id = 123
  WHERE vendor_id = 122; /*These three lines clone the old data*/

  DELETE FROM vendors
  WHERE vendor_id = 122; /*After the old data has been cloned, the old data is removed*/

  UPDATE vendors
  SET vendor_name = 'FedUP' /*The new name*/
  WHERE vendor_id = 123;

  IF sql_error = FALSE THEN /*Checks to see if there has been an error*/
    COMMIT; /*Should no error have occured, the changes will be "commited", or saved*/
    SELECT 'The transaction succeeded and has been committed.';
  ELSE
    ROLLBACK; /*Otherwise the changes will be rolled back, allowing the developer to fix the code and try again*/
    SELECT 'The transaction failed and has been rolled back.';
  END IF;
END//

DELIMITER ;

CALL test();