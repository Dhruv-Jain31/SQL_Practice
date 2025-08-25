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


-- HAVING clause is used to filter records that work on aggregated data.
SELECT 
    officeCode,  -- selecting office code
    city,  -- selecting city
    COUNT(employeeNumber) AS employeeCnt -- counting number of employees in each office
FROM employees
JOIN offices ON employees.officeCode = offices.officeCode  -- joining employees and offices table on office code
WHERE officeCode IN (1,2,3,4,5,6)
GROUP BY officeCode
HAVING employeeCnt > 5; -- filtering offices with more than 5 employees


-- Total payments from each customer after a certain date
SELECT 
    customerNumber,  -- selecting customer number
    customerName,
    SUM(amount) AS totalOrderValue
FROM payements
JOIN customers using (customerNumber)  -- joining payments and customers table on customer number
WHERE paymentDate > '2005-01-01'  -- filtering payments after a certain date
GROUP BY customerNumber, customerName
HAVING totalOrderValue > 5000  -- filtering customers with total payments


-- Value of each unique order sorted by total order value in descending order
SELECT
    orderNumber,  -- selecting order number
    SUM(quantityOrdered * priceEach) AS totalOrderValue
FROM orderdetails
GROUP BY orderNumber
ORDER BY totalOrderValue DESC;  -- sorting by total order value in descending order


-- Value of each unique order, and it's customer no., customer name, and order date sorted by total order value in descending order
SELECT 
    orderNumber,
    customerNumber,
    customerName,
    SUM(quantityOrdered * priceEach) AS totalOrderValue,
FROM orderdetails
JOIN orders USING (orderNumber)
JOIN customers USING (customerNumber)
GROUP BY orderNumber
ORDER BY totalOrderValue DESC;


-- Value of each unique order, and it's customer no., customer name, employee number, employee number, and order date sorted by total order value in descending order
SELECT 
    orderNumber,
    customerNumber,
    customerName,
    employeeNumber,
    CONCAT(firstName, ' ', lastName) AS employeeName,
    orderDate,
    SUM(quantityOrdered * priceEach) AS totalOrderValue
FROM orderdetails
JOIN orders USING (orderNumber)
JOIN customers USING (customerNumber)
JOIN employees
    ON customers.salesRepEmployeeNumber = employees.employeeNumber
GROUP BY orderNumber
ORDER BY totalOrderValue DESC; 

-- Number of orders through each sales representative
SELECT COUNT(orderNumber) AS totalOrders,
       employeeNumber,
       CONCAT(firstName, ' ', lastName) AS employeeName
FROM orders
JOIN employees
    ON orders.salesRepEmployeeNumber = employees.employeeNumber
GROUP BY employeeNumber


-- No. of orders through each country on each Date group by clause for two columns
SELECT country,
        orderDate,
        COUNT(*) AS totalOrders
FROM orders
JOIN customers USING (customerNumber)
GROUP BY country, orderDate; 


-- Find customers from france whose total order value > 80,000 across all their orders
SELECT
    c.customerNumber,
    c.customerName,
    SUM(od.quantityOrdered * od.priceEach) AS totalOrderValue
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE c.country = 'France'
GROUP BY c.customerNumber, c.customerName
HAVING totalOrderValue > 80000;