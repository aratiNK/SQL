------------------------ NO JOIN ------------------
--return data from Tables without combining them.

--Retrieve all data from customers and as seperate results

SElEcT *
FROM customers;

SELECT *
FROM orders;

------------------- 1. INNER JOIN ---------------

-- Retuen only matching Rows from both tables.
-- Order of Table does not matter.
-- INNER is default
-- First colums names loaded and then id's are checked with condition one by one and then , takes valus from 1st written table name and then compares it with second written table

-- Get all customers along with their orders, but only for customers who have  places an order
SELECT * 
FROM orders 
INNER JOIN customers
ON id = customer_id

SELECT * 
FROM orders 
JOIN customers
ON id = customer_id

SELECT 
	customers.id,
	orders.order_id,
	customers.first_name,
	orders.sales
FROM orders 
JOIN customers
ON id = customer_id


-- For tables that have longer names use alias, 
SELECT 
	c.id,
	o.order_id,
	c.first_name,
	o.sales
FROM orders AS o
JOIN customers AS c
ON c.id = o.customer_id

------------------------------------ LEFT JOIN ------------------------
-- Get all customers along with their orders, including those without orders
-- Order is IMPORTANT, customer is main table
-- While executing it puts all customer data without matching and checks condition for 2nd table i.e, orders
-- It adds NULL for no match in 2nd table

SELECT 
	c.id,
	o.order_id,
	c.first_name,
	o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id

------------------------------- RIGHT JOIN --------------------------
-- Return All rows from Right and only Matching from left
-- 2nd or right table is main table all rows included and for 1st one condition is checked

-- Get all customers along with their orders, including orders without matching customers

SELECT 
	c.id,
	o.order_id,
	c.first_name,
	o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id

SELECT 
	c.id,
	o.order_id,
	c.first_name,
	o.sales
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id

--------------------------------- FULL JOIN ---------------------------
-- Get all customers and all orders if there is no match

SELECT 
	c.id,
	o.order_id,
	c.first_name,
	o.sales
FROM customers AS c
FULL JOIN  orders AS o
ON c.id = o.customer_id

---------------------------------- LEFT ANTI JOIN ----------------------------
-- Return Row from Left that has no MATCH in right.
-- only unmatching rows. A -> Primary Main source of data,  Look up (Filter) Not for Data, just a Filter

--Get alll customers who have not placed any order

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = O.customer_id
WHERE O.customer_id IS NULL

--------------------------------- RIGHT ANTI JOIN -------------------
-- Returns Rows from Right that has NO MATCH in Left
-- Get all orders without matching customers

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = O.customer_id
WHERE c.id IS NULL

------------------------------ Full Anti JOIN ---------------------
--Returns only Rows that Don't match in either Table
-- Order not important

SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = O.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL

-- Get all customers along with their orders, but only for customers who have placed an order
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = O.customer_id
WHERE order_id IS NOT NULL

-------------------------- CROSS JOIN --------------------------------
-- Combine Every Row from left with Every Row from Right, All possible combinations - Cartesian JOIN

-- Generate all possible combinations of customers and orders
SELECT *
FROM customers
CROSS JOIN orders





