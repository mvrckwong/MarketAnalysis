-- Create view for product sales
CREATE OR REPLACE VIEW market.product_sales_view AS
WITH product_sales AS (
    SELECT 
        overall_transactions.product_id,
        SUM(quantity * product_retail_price) AS total_sales
    FROM 
        market.overall_transactions
    JOIN 
        market.products ON overall_transactions.product_id = products.product_id
    GROUP BY 
        overall_transactions.product_id
)
SELECT 
    product_sales.product_id,
    AVG(total_sales) AS average_sales
FROM 
    product_sales
GROUP BY 
    product_sales.product_id;