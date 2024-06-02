-- Check for the table data types
SELECT column_name, data_type, table_name
FROM information_schema.columns
WHERE table_name = 'Customers';

-- List all tables
SELECT * FROM pg_tables;

-- List all indexes
SELECT * FROM pg_index;

-- List all tables
SELECT * FROM INFORMATION_SCHEMA.TABLES;

-- List all columns
SELECT * FROM INFORMATION_SCHEMA.COLUMNS;

-- List all the constraints
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS;

-- Explore tables and columns that has date
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
FROM information_schema.columns
WHERE information_schema.columns.table_schema='public' AND (information_schema.columns.column_name LIKE 'date%' OR information_schema.columns.column_name LIKE '%date')
ORDER BY TABLE_NAME ASC;