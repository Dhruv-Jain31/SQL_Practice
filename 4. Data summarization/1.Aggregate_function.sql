-- AGGREGATE FUNCTIONS = MAX(), MIN(), AVG(), SUM(), COUNT()

-- MAX() = returns the largest value of the selected column.
-- MIN() = returns the smallest value of the selected column.
-- AVG() = returns the average value of a numeric column.
-- SUM() = returns the total sum of a numeric column.
-- COUNT() = returns the number of rows that matches a specified criteria.

SELECT 
    MAX(amount) AS "Maximum Amount",
    MIN(amount) AS "Minimum Amount",
    AVG(amount) AS "Average Amount",
    SUM(amount) AS "Total Amount",
    COUNT(*) AS "Number of Payments"  -- counting total number of rows
FROM payments;

SELECT 
    customerNumber,
    COUNT(orderNumber) AS "Total Orders", -- counting total number of orders for each customer but it discards customers with no orders or null values
    SUM(quantityOrdered * priceEach) AS "Total Sales" -- calculating total sales by multiplying quantity ordered with price each
FROM orderdetails;

SELECT 
    COUNT(*) FROM orders; -- counting total number of rows in orders table
    WHERE status = 'Shipped'; -- counting total number of rows with status 'Shipped'
FROM orders;


SELECT MAX(paymentDate) AS "Last Payment Date"  -- getting the most recent payment date
       MIN(paymentDate) AS "First Payment Date"  -- getting the earliest payment date
FROM payments
WHERE customerNumber = 103;  -- for a specific customer


-- GROUP BY clause is used with aggregate functions to group the result set by one or more columns.
SELECT 
    productline,  -- selecting product line
    COUNT(*) AS productCount,
FROM products
GROUP BY productline;  -- grouping by product line

-- GROUP BY with multiple columns
SELECT 
    productline,  -- selecting product line
    productScale,  -- selecting product scale
    COUNT(*) AS productCount    
FROM products
GROUP BY productline, productScale;  -- grouping by product line and product scale

-- GROUP BY WITH JOIN
SELECT 
    officeCode,  -- selecting office code
    city,  -- selecting city
    state,  -- selecting state
    COUNT(employeeNumber) AS employeeCount  -- counting number of employees in each office
FROM employees
JOIN offices ON employees.officeCode = offices.officeCode  -- joining employees and offices table on office code
GROUP BY officeCode, city, state;  -- grouping by office code, city and state