-- Create a table to hold the calendar dates
CREATE TABLE AutoCalendar (
    DayStart DATE
);

-- Declare variables for the loop
DO $$ 
DECLARE 
    startDate DATE := '1997-01-01';
    endDate DATE := '1998-12-31';
BEGIN
    WHILE startDate <= endDate LOOP
        INSERT INTO AutoCalendar (DayStart) VALUES (startDate);
        startDate := startDate + INTERVAL '1 day';
    END LOOP;
END $$;