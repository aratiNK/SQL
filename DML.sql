------------------------------ Data Manipulation Language -----------------
------ DML ---------
-- Insert, Update or Delete rows 

--  INSERT : OPTIONAL if no columns are specified SQL expects values for all columns 
-- RULE : Match the number of columns and values 

INSERT INTO customers (id, first_name, country, score)
VALUES 
	(7, 'Sam', NULL, 100)

INSERT INTO customers (id, first_name)
VALUES 
	(10, 'Helen')
-- Other column values are added as NULL

SELECT * FROM customers

--- Copy data from 'customers' table into 'persons' 
INSERT INTO persons(id, person_name, birth_date, phone)
SELECT 
	id,
	first_name,
	NULL,
   'Unkonown'
FROM customers

SELECT * FROM persons

--------------- UPDATE ---------------
-- Change the score of customer 6 to 0

SELECT * FROM customers
----  !!! WITHOUT WHERE ALL rows updated
-- Check with SELECT before running UPDATE to avoid updating the wrong data. 

UPDATE customers
SET score = 0,
	country = 'UK'
WHERE id = 6

/* SELECT *
FROM customers
WHERE id = 6  */

-- Change the score of customer with ID 10 to 0 and update the country to 'UK'
-- Update all customers with NULL score by setting theiri score to 0

UPDATE customers
SET score = 0
WHERE score IS NULL









