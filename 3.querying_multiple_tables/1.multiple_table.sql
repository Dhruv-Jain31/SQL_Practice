
-- INNER JOIN example
-- This query retrieves payment details along with customer names for payments greater than 50,000.
SELECT payments.customerNumber,
        paymentDate,
        amount,
        customerName

FROM payments
INNER JOIN customers ON payments.customerNumber = customers.customerNumber
WHERE amount > 50000