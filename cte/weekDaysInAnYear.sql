WITH RECURSIVE sundaysInAnYear AS (
SELECT
CAST(CONCAT(YEAR(CURDATE()),'-01-01') AS DATE) AS thisDate, 
CAST(CONCAT(YEAR(CURDATE())+1,'-01-01') AS DATE) AS lastDate,
DAYOFWEEK(CAST(CONCAT(YEAR(CURDATE()),'- 01-01') AS DATE)) as weekDay,
MONTH(CAST(CONCAT( YEAR(CURDATE()),'-01-01') AS DATE)) AS monthOfTheWeek
UNION ALL
SELECT
	DATE_ADD(thisDate, INTERVAL 1 DAY) AS thisDate, lastDate, 
    DAYOFWEEK(DATE_ADD(thisDate, INTERVAL 1 DAY)) as weekDay, 
    MONTH(DATE_ADD(thisDate, INTERVAL 1 DAY)) AS monthOfTheWeek 
    FROM sundaysInAnYear 
    WHERE DATE_ADD(thisDate, INTERVAL 1 DAY)<lastDate
) SELECT
CASE monthOfTheWeek
WHEN 1 THEN 'January'
WHEN 2 THEN 'February'
WHEN 3 THEN 'March'
WHEN 4 THEN 'April'
WHEN 5 THEN 'May'
WHEN 6 THEN 'June'
WHEN 7 THEN 'July'
WHEN 8 THEN 'August'
WHEN 9 THEN 'September'
WHEN 10 THEN 'October'
WHEN 11 THEN 'November'
WHEN 12 THEN 'December'
END AS MonthName, 
SUM(CASE WHEN weekDay=1 THEN 1 END) AS Sunday, 
SUM(CASE WHEN weekDay=2 THEN 1 END) AS Monday, 
SUM(CASE WHEN weekDay=3 THEN 1 END) AS Tuseday, 
SUM(CASE WHEN weekDay=4 THEN 1 END) AS Wednesday, 
SUM(CASE WHEN weekDay=5 THEN 1 END) AS Thursday, 
SUM(CASE WHEN weekDay=6 THEN 1 END) AS Friday, 
SUM(CASE WHEN weekDay=7 THEN 1 END) AS Saturday 
	FROM sundaysInAnYear GROUP BY monthOfTheWeek;