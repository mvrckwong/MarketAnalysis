CREATE OR REPLACE VIEW Transactions_1997_Summary AS
SELECT 
    COUNT(DISTINCT store_id) AS unique_store_ids,
    COUNT(DISTINCT stock_date) AS unique_stock_dates,
    COUNT(DISTINCT product_id) AS unique_product_ids,
    COUNT(DISTINCT customer_id) AS unique_customer_ids,
    COUNT(DISTINCT transaction_date) AS unique_transaction_dates,
    SUM(quantity) AS total_quantity_transactions
FROM Transactions_1997;
