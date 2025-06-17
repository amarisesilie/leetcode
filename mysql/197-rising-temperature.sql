SELECT id
FROM (
    SELECT *, 
            -- previous date in the table and previous temperature in the table
            LAG(recordDate) OVER (ORDER BY recordDate) AS previous_date,
            LAG(temperature) OVER (ORDER BY recordDate) AS previous_temperature
    FROM Weather
) AS S
-- if the difference between the two dates in the table is not 1, then previous date
-- was not the previous date in the calender
WHERE DATEDIFF(recordDate, previous_date) = 1 AND temperature > previous_temperature
