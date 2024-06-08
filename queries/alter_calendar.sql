-- Add columns in the calendar table
ALTER TABLE calendar
ADD COLUMN calendar_year INT,
ADD COLUMN calendar_quarter INT,
ADD COLUMN calendar_month INT,
ADD COLUMN month_name VARCHAR(20),
ADD COLUMN day_of_month INT,
ADD COLUMN day_of_week INT,
ADD COLUMN day_name VARCHAR(10),
ADD COLUMN week_of_year INT;

-- Update the calendar table with calculated values for each column
UPDATE calendar
SET 
    calendar_year = EXTRACT(YEAR FROM calendar_date),
    calendar_quarter = EXTRACT(QUARTER FROM calendar_date),
    calendar_month = EXTRACT(MONTH FROM calendar_date),
    month_name = TO_CHAR(calendar_date, 'Month'),
    day_of_month = EXTRACT(DAY FROM calendar_date),
    day_of_week = EXTRACT(DOW FROM calendar_date) + 1, -- DOW in PostgreSQL returns 0-6, adding 1 to make it 1-7
    day_name = TO_CHAR(calendar_date, 'Day'),
    week_of_year = EXTRACT(WEEK FROM calendar_date);
