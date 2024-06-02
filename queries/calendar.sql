-- Create the SampleCalendar table
CREATE TABLE SampleCalendar (
    Date DATE PRIMARY KEY,
    Year INT,
    Month INT,
    Day INT,
    DayOfWeek INT,
    WeekOfYear INT,
    Quarter INT,
    IsWeekend BIT
);

-- Populate the SampleCalendar table with dates from 01/01/1997 to 12/31/1998
DECLARE @StartDate DATE = '1997-01-01';
DECLARE @EndDate DATE = '1998-12-31';

;WITH DateCTE AS (
    SELECT @StartDate AS Date
    UNION ALL
    SELECT DATEADD(DAY, 1, Date)
    FROM DateCTE
    WHERE DATEADD(DAY, 1, Date) <= @EndDate
)
INSERT INTO SampleCalendar (Date, Year, Month, Day, DayOfWeek, WeekOfYear, Quarter, IsWeekend)
SELECT 
    Date,
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    DAY(Date) AS Day,
    DATEPART(WEEKDAY, Date) AS DayOfWeek,
    DATEPART(WEEK, Date) AS WeekOfYear,
    DATEPART(QUARTER, Date) AS Quarter,
    CASE 
        WHEN DATEPART(WEEKDAY, Date) IN (1, 7) THEN 1 
        ELSE 0 
    END AS IsWeekend
FROM DateCTE
OPTION (MAXRECURSION 0);

-- Verify the data
SELECT * FROM SampleCalendar;
