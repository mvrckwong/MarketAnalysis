-- Create Summary Statistics for Customers
CREATE OR REPLACE VIEW "CustomersSummaryStats" AS
SELECT 
    CAST(COUNT(DISTINCT customer_id) AS INTEGER) AS unique_customers,
    CAST(AVG(total_children) AS NUMERIC(10,2)) AS avg_total_children,
    CAST(COUNT(DISTINCT customer_country) AS INTEGER) AS unique_countries,
    CAST(COUNT(DISTINCT customer_state_province) AS INTEGER) AS unique_states_provinces,
    CAST(COUNT(DISTINCT customer_city) AS INTEGER) AS unique_cities
FROM "Customers";

-- Create Summary Statistics for Products

-- Create Summary Statistics for Regions
