-- find products that have same product line as of "1917 grand touring car"
SELECT productName
FROM products
WHERE productLine = (SELECT productLine FROM products WHERE productName = '1917 Grand Touring Car');

-- find cars that are costlier than "1936 mercedes benz 500k special roadster"
SELECT * 
FROM products
WHERE productLine REGEXP "car" AND MSRP > (
    SELECT MSRP
    FROM products
    WHERE productName = "1936 Mercedes-Benz 500K Special Roadster"
);

-- find cars costlier than the average price of cars
SELECT *
FROM products
WHERE productLine REGEXP "car" AND MSRP > (
    SELECT AVG(MSRP)
    FROM products
    WHERE productLine REGEXP "car"
);


-- find customers who have never placed an order
SELECT COUNT(customerNumber)
FROM customers
WHERE customerNumber NOT IN (SELECT DISTINCT customerNumber FROM orders);

-- using join
Select customerNumber
FROM customers
LEFT JOIN orders USING (customerNumber)
WHERE orderNumber IS NULL;


-- find customers who have ordered with product code "S10_1678"
SELECT customerName
FROM customers
WHERE customerNumber IN (
    SELECT DISTINCT customerNumber
    FROM orders
    JOIN orderdetails USING (orderNumber)
    WHERE productCode = "S10_1678"
);

-- using join
SELECT DISTINCT customerName
FROM customers
JOIN orders USING (customerNumber)
JOIN orderdetails USING (orderNumber)
WHERE productCode = "S10_1678";