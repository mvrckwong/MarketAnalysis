CREATE VIEW Customers_Summary AS
SELECT 
    COUNT(DISTINCT customer_id) AS unique_customers,
    AVG(num_children_at_home) AS avg_children_at_home,
    COUNT(DISTINCT customer_address) AS unique_addresses,
    COUNT(DISTINCT acct_open_date) AS unique_acct_open_dates,
    AVG(yearly_income) AS avg_yearly_income,
    COUNT(DISTINCT customer_acct_num) AS unique_customer_acct_nums,
    COUNT(DISTINCT first_name) AS unique_first_names,
    AVG(total_children) AS avg_total_children,
    COUNT(DISTINCT customer_country) AS unique_countries,
    COUNT(DISTINCT customer_state_province) AS unique_states_provinces,
    COUNT(DISTINCT last_name) AS unique_last_names,
    COUNT(DISTINCT customer_id) AS unique_customer_ids,
    COUNT(DISTINCT customer_city) AS unique_cities,
    COUNT(DISTINCT customer_postal_code) AS unique_postal_codes
FROM Customers;

CREATE VIEW Customers_Occupation_Dist AS
SELECT occupation, COUNT(*) AS count FROM Customers GROUP BY occupation;

CREATE VIEW Customers_Gender_Dist AS
SELECT gender, COUNT(*) AS count FROM Customers GROUP BY gender;

CREATE VIEW Customers_Marital_Status_Dist AS
SELECT marital_status, COUNT(*) AS count FROM Customers GROUP BY marital_status;

CREATE VIEW Customers_Member_Card_Dist AS
SELECT member_card, COUNT(*) AS count FROM Customers GROUP BY member_card;

CREATE VIEW Customers_Homeowner_Dist AS
SELECT homeowner, COUNT(*) AS count FROM Customers GROUP BY homeowner;

CREATE VIEW Customers_Education_Dist AS
SELECT education, COUNT(*) AS count FROM Customers GROUP BY education;
