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
