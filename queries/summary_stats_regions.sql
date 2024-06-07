-- Aggregate Functions: Summary of region information
CREATE OR REPLACE VIEW Regions_Summary AS
SELECT 
    COUNT(DISTINCT sales_district) AS unique_sales_districts,
    COUNT(DISTINCT region_id) AS unique_region_ids,
    COUNT(DISTINCT sales_region) AS unique_sales_regions
FROM Regions;