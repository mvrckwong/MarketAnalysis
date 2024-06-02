CREATE OR REPLACE VIEW "SummaryStatistics" AS
SELECT 
	COUNT(*) AS total_transactions
FROM "Transactions_1997";