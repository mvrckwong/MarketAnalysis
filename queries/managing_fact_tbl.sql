-- View for Overall Transactions
CREATE OR REPLACE VIEW "overall_transactions" AS
SELECT *
FROM "Transactions_1997"
UNION ALL
SELECT *
FROM "Transactions_1998"
ORDER BY transaction_date ASC;