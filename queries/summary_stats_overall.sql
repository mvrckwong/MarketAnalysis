CREATE OR REPLACE VIEW "overall_summary" AS
SELECT 
	COUNT(*) AS total_transactions
FROM overall_transactions