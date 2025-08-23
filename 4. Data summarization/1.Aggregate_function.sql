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
    COUNT(*) AS "Number of Payments"
FROM payments;

SELECT 
    customerNumber,
    COUNT(orderNumber) AS "Total Orders",
    SUM(quantityOrdered * priceEach) AS "Total Sales" -- calculating total sales by multiplying quantity ordered with price each
FROM orderdetails;