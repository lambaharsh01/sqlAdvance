FOR SCENARIOS WHEN YOU NEED COLLECTIVE/AGGREGATED DATA OF PREVIOUS n ROWS
I.E ( a manger want to se 7 day average of each day date + date - 1, ... date - 6 / 7 and he wants to see it for each day like in the question )

SLIDING WINDOW IS CALCULATED USING ( ORDER BY column_name ROWS BETWEEN n PRECEDING AND CURRENT ROW ) // it simply takes current and previous 6 rows making a window of 7 rows and then performing aggregation function over them 


WITH aggregated AS (
    SELECT visited_on, SUM(amount) AS amount FROM Customer GROUP BY visited_on
), refined AS (
    SELECT 
        visited_on, 
        SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS sum,
        AVG(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS avg,
        COUNT(*) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ) AS day_aggregated,
        ROW_NUMBER() OVER (ORDER BY visited_on ) AS day_aggregated
    FROM aggregated
 ) SELECT visited_on, sum AS amount, ROUND(avg,2) AS average_amount FROM refined WHERE day_aggregated >= 7
