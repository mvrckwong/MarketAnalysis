-- Aggregate Functions: Summary of product information
CREATE OR REPLACE VIEW Products_Summary AS
SELECT 
    AVG(product_weight) AS avg_product_weight,
    COUNT(DISTINCT product_name) AS unique_product_names,
    COUNT(DISTINCT product_id) AS unique_product_ids,
    COUNT(DISTINCT product_sku) AS unique_product_skus,
    AVG(product_cost) AS avg_product_cost,
    AVG(product_retail_price) AS avg_product_retail_price,
    COUNT(DISTINCT product_brand) AS unique_product_brands
FROM Products;

-- Distribution: Low Fat Distribution
CREATE OR REPLACE VIEW Products_Low_Fat_Dist AS
SELECT 
    low_fat, 
    COUNT(*) AS count 
FROM Products 
GROUP BY low_fat;

-- Distribution: Recyclable Products
CREATE OR REPLACE VIEW Products_Recyclable_Dist AS
SELECT 
    recyclable, 
    COUNT(*) AS count 
FROM Products 
GROUP BY recyclable;
