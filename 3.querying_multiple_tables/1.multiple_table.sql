
-- INNER JOIN example
-- This query retrieves payment details along with customer names for payments greater than 50,000.
SELECT payments.customerNumber,
        paymentDate,
        amount,
        customerName
FROM payments
INNER JOIN customers ON payments.customerNumber = customers.customerNumber
WHERE amount > 50000


--using aliases
SELECT p.customerNumber AS "Customer Number",
        p.paymentDate AS "Payment Date",
        p.amount AS "Amount",
        c.customerName AS "Customer Name"
FROM payments AS p
INNER JOIN customers AS c ON p.customerNumber = c.customerNumber
WHERE p.amount > 50000;


--joining multiple tables
SELECT orderNumber,
        status,
        o.customerNumber,
        c.customerName,
        e.firstName AS "Sales Person Name",
        e.jobTitle
FROM orders AS o
JOIN customers AS c ON o.customerNumber = c.customerNumber  --first join
JOIN employees AS e ON o.salesRepEmployeeNumber = e.employeeNumber; --second join


-- using explicit JOIN syntax
SELECT p.customerNumber,
        paymentDate,
        amount,
        customerName
FROM payments p, customers c
WHERE p.customerNumber = c.customerNumbe;  -- here we are joining two tables with JOIN syntax

-- self join: we join table with itself
SELECT emp.employeeNumber,
        emp.firstName,
        emp.jobTitle,
        mgr.firstName AS "Manager First Name",
        mgr.jobTitle
FROM employees emp
JOIN employees mgr ON emp.reportsTo = mgr.employeeNumber;  -- here we are joining employees table with itself to get manager details


-- LEFT JOIN example
-- This query retrieves all customers along with their customets, including those who have not made any orders
SELECT c.customerNumber,
        customerName,
        o.orderNumber,
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber;

-- RIGHT JOIN example
-- This query retrieves all orders along with their customers, including those orders that do not have associated customers
SELECT c.customerNumber,
        customerNamee,
        o.orderNumber,
FROM customers c
RIGHT JOIN orders 0 ON c.customerNumber = o.customerNumber;


--SELF OUTER JOIN
SELECT emp.employeeNumber,
        emp.firstName,
        emp.jobTitle,
        mgr.firstName AS "Manager First Name",
        mgr.jobTitle AS "Manager Job Title"
FROM employees emp
LEFT JOIN employees mgr ON emp.reportsTo = mgr.employeeNumber;  -- here we are joining employees table with itself to get manager details

