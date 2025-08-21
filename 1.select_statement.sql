-- selecting the db
USE classicmodels;

-- select statement
SELECT * FROM employees WHERE officeCode=1 ORDER BY firstName;

-- select few columns only
SELECT firstName, lastName FROM employees WHERE officeCode=1 ORDER BY firstName;