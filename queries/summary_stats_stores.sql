-- Aggregate Functions: Summary of store information
CREATE OR REPLACE VIEW Stores_Summary AS
SELECT 
    COUNT(DISTINCT store_street_address) AS unique_store_street_addresses,
    AVG(grocery_sqft) AS avg_grocery_sqft,
    COUNT(DISTINCT region_id) AS unique_region_ids,
    AVG(total_sqft) AS avg_total_sqft,
    COUNT(DISTINCT first_opened_date) AS unique_first_opened_dates,
    COUNT(DISTINCT last_remodel_date) AS unique_last_remodel_dates,
    COUNT(DISTINCT store_state) AS unique_store_states,
    COUNT(DISTINCT store_phone) AS unique_store_phones,
    COUNT(DISTINCT store_id) AS unique_store_ids,
    COUNT(DISTINCT store_name) AS unique_store_names,
    COUNT(DISTINCT store_city) AS unique_store_cities,
    COUNT(DISTINCT store_country) AS unique_store_countries
FROM Stores;

-- Distribution: Store Type Distribution
CREATE OR REPLACE VIEW Stores_Type_Dist AS
SELECT 
    store_type, 
    COUNT(*) AS count 
FROM Stores 
GROUP BY store_type;