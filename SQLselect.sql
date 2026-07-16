--This is a comment 

/* This is 
a 
comment 
provided here */

----------SELECT, FROM ----------

SELECT *
FROM customers;

SELECT * 
FROM orders; 

SELECT 
	first_name, 
	score, 
	country
FROM customers  --do not add , after score sql expects another column name after that, and order is maintained here

----------------------  WHERE ---------------------------
--  Filters data based on conditions like score must greater than 500 or country must be india 
-- (1st) from is executed(from which table?) and then (2nd) where is executed (It goes on removing the rows that does not satisfy the condition)
-- (3rd) SELECT -> If added multiple filters like name and country then sql will also remove the columns 

--Customers with score not equal to 0
SELECT 
	first_name,
	score
FROM customers     -- remove columns
WHERE score > 0    --filters rows

--Retrieve customers from Germany
SELECT 
	first_name,
	country
FROM customers          
WHERE country = 'Germany'  --2 single quotes for string type 

-----------------------------  SORTING DATA USING ORDER BY -----------------------------

-- Sort in ascending(low -> high) or descending(high -> low) 
-- write colume name that needs to be sorted and mechanism after that like ASC or DESC by DEFAULT it is ASC
-- EX: ORDER BY score 
-- 1ST  FROM , 2ND -> Sort the result -> start moving around rows and sorted accordingly.

--Retrieve all customers and sort the results by the highest score first
SELECT *
FROM customers
ORDER BY score DESC

--opposite
SELECT *
FROM customers
ORDER BY score ASC


--------------- NESTED ORDER BY ----------------
 -- sort multiple colums here sort 2 colums at a time

-- Retrieve all customers and sort the result by the country anf the highest score
SELECT *
FROM customers
ORDER BY score DESC, country ASC  ---IMPP : COLUMN ORDER in  ORDER BY is crucial, as sorting is sequential
 
----------------------------- GROUP BY  ---------------------------
--COMBINES ROWS with the same value, Aggregate a column By another CAOLUMN
--(1ST) FROM next (2ND) GROUP BY 
--ALIAS - AS shorthand name (Label assigned to a column or a table in a query), only used in this query
--RULE : All column in SELECT must be either aggregated or included in the GROUP BY

--Total score for each country 

SELECT 
	country,
	SUM(score) AS total_score
FROM customers
GROUP BY country

/* 
SELECT 
	country,
	first_name
	SUM(score) AS total_score
FROM customers
GROUP BY country */ --------------ERROR ERROR

-- GROUP BY will not execute without Aggregate functions it will show error

 --FIX

SELECT 
	country,
	first_name,
	SUM(score) AS total_score
FROM customers
GROUP BY country, first_name -- Get 5 rows there fore be careful what you include in GROUP BY

--Find the total score and total number of customers for each country 

SELECT 
	country,
	COUNT(id) AS total_score,
	SUM(score) AS total_customer
FROM customers
GROUP BY COUNTRY

-------------------------------- HAVING --------------------------------
--------------------- FILTER DATA AFTER AGGREGATION ---------------------
-- 1-> FROM, 2 -> GROUP BY, 3 -> HAVING 

SELECT 
country, 
SUM(score) AS total_score
FROM customers
GROUP BY country
HAVING  SUM(score) > 800

-- BEFORE AGGREGATION(raw values not the sum) - use where, AFTER AGGREGATION(values that we got after summation) - use HAVING

--Find the average score for each country considering only customers with a score not equal to 0 and return only those countries with an average score greater than 430
SELECT
	country,
	AVG(score) AS average_scoore
FROM customers
WHERE score > 0
GROUP BY country
HAVING AVG(score) > 430

------------------------------------- DISTINCT --------------------------
------------------ Remove Duplicates ----------------
--Do not use it until it is necessary; it can slow down your query

--Return unique list of all countries 
SELECT DISTINCT country
FROM customers


--------------- TOP -------------
SELECT TOP 3 *
FROM customers

-- Retrieve the Top 3 Customers with the Highest Scores
SELECT TOP 3 
	id,
	first_name,
	score
FROM customers
ORDER BY score DESC


-- Get the 2  most recent Orders
SELECT TOP 2 *
FROM orders
ORDER BY order_date DESC


---------------- Execution Order vs Coding Order -------------
