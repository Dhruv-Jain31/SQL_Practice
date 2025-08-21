-- selecting the db
USE classicmodels;

-- select statement
SELECT * FROM employees WHERE officeCode=1 ORDER BY firstName;

-- select few columns only
SELECT firstName, lastName FROM employees WHERE officeCode=1 ORDER BY firstName;

-- changing the order of columns
SELECT lastName, firstName FROM employees WHERE officeCode=1 ORDER BY firstName;


-- select clause with arithmetic expression for columns
SELECT productcode,
		productName,
        buyPrice,
        MSRP AS "Selling Price",
        (MSRP*0.9) AS "Discount Price"
FROM classicmodels.products;

-- select with alias
SELECT productCode AS "Code",
        productName AS "Name",
        buyPrice AS "Buy Price",
        MSRP AS "Selling Price",
        (MSRP*0.9) AS "Discount Price"
FROM classicmodels.products;

-- WHERE: with condition

SELECT * FROM classicmodels.orders WHERE status='Shipped';
SELECT * FROM classicmodels.orders WHERE status<>'Shipped';  --<> not equal to

-- WHERE: with multiple conditions and logical operators
 SELECT * FROM classicmodels.payements
    WHERE amount>=40000 AND amount<=60000;

SELECT * FROM classicmodels.payments 
    WHERE NOT(amount>=40000 AND amount<=60000);

-- AND and OR in single operator

SELECT * FROM classicmodels.payments
    WHERE (amount <= 40000 OR amount >= 60000) AND paymentDate >= '2004-01-01';