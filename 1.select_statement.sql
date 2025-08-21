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

-- WHERE: with IN operator
SELECT * FROM classicmodels.employees WHERE officeCode=1 OR officeCode=2 OR officeCode=3;
SELECT * FROM classicmodels.employees WHERE officeCode IN (1, 2, 3);
SELECT * FROM classicmodels.employees WHERE officeCode NOT IN (1, 2, 3);

-- WHERE: with BETWEEN operator
SELECT * FROM classicmodels.customers WHERE creditLimit >= 50000 AND creditLimit <= 100000;
SELECT * FROM classicmodels.customers WHERE creditLimit BETWEEN 50000 AND 100000;

--OTHER EXAMPLE
SELECT * FROM classicmodels.customers WHERE creditLimit BETWEEN '2003-05-31' AND '2004-05-31'; # BETWEEN can be used with date values as well

-- WHERE: with LIKE operator
SELECT * FROM classicmodels.employess WHERE jobTitle LIKE 'Manager%';  -- starts with sale
SELECT * FROM classicmodels.employees WHERE jobTitle LIKE '%Manager';  -- ends with Manager
SELECT * FROM classicmodels.employees WHERE jobTitle LIKE '%Manager%';  -- contains Manager
SELECT * FROM classicmodels.employees WHERE jobTitle LIKE '_Manager';  -- _ only one character before Manager
SELECT * FROM classicmodels.employees WHERE jobTitle LIKE 'M_nager';  -- _ can be used to replace a single character
SELECT * FROM classicmodels.employees WHERE jobTitle LIKE '___Manager';  -- _ can be used to replace multiple characters, here 3 characters before Manager
SELECT * FROM classicmodels.employees WHERE jobTitle LIKE '___Manager___'; -- _ can be used to replace multiple characters, here 3 characters before and 3 characters after Manager

--REGEXP operator
    -- REGEXP is used for pattern matching
    -- ^ is used to match the start of a string
    -- $ is used to match the end of a string
    -- | is used to match either of the patterns(logical OR)
    -- [abcd] is used to match any one of the characters in the brackets
    -- [a-z] is used to match any one of the characters in the range
    -- [^abcd] is used to match any character except the ones in the brackets
    -- [abcd$] is used to match any character in the brackets or the end of the string

SELECT * FROM classicmodels.employees WHERE jobTitle REGEXP 'Manager';  -- contains Manager
SELECT * FROM classicmodels.employees WHERE jobTitle REGEXP '^Manager';  -- starts with Manager
SELECT * FROM classicmodels.employees WHERE jobTitle REGEXP 'Manager$';  -- ends with Manager
SELECT * FROM classicmodels.employees WHERE jobTitle REGEXP 'Manager|Director';  -- contains Manager or Director
SELECT * FROM classicmodels.employees WHERE jobTitle REGEXP '^a|^b';  -- starts with a lowercase or b lowercase letter
SELECT * FROM classicmodels.employees WHERE jobTitle REGEXP '^[a-z]|[m-p]$';  -- starts with a lowercase letter and ends with a lowercase letter between m and p
SELECT * FROM classicmodels.employees WHERE jobTitle REGEXP '^[A-Z]';  -- starts with an uppercase letter
SELECT * FROM classicmodels.employees WHERE jobTitle REGEXP '^[A-Z][a-z]';  -- starts with an uppercase letter followed by a lowercase letter
SELECT * FROM classicmodels.employees WHERE jobTitle REGEXP '^[A-Z][a-z]{2}';  -- starts with an uppercase letter followed by 2 lowercase letters
SELECT * FROM classicmodels.employees WHERE jobTitle REGEXP '^[A-Z][a-z]{2,}';  -- starts with an uppercase letter followed by 2 or more lowercase letters