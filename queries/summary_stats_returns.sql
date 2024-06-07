-- Aggregate Functions: Summary of return information
CREATE OR REPLACE VIEW Returns_Summary AS
SELECT 
    COUNT(DISTINCT product_id) AS unique_product_ids,
    COUNT(DISTINCT store_id) AS unique_store_ids,
    COUNT(DISTINCT return_date) AS unique_return_dates,
    SUM(quantity) AS total_quantity_returns
FROM 
    Returns;