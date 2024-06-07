CREATE OR REPLACE VIEW "OverallTransactions" AS
SELECT *
FROM 
    "Transactions_1997"
UNION ALL
SELECT *
FROM 
    "Transactions_1998"
ORDER BY transaction_date ASC;