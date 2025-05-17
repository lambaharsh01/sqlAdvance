WITH RECURSIVE sundays AS( 
    SELECT CAST(CONCAT(YEAR(CURDATE()), '-', LPAD(MONTH(CURDATE()), 2, '0'), '-01') AS DATE) as itDay,
    DAYOFWEEK(CAST(CONCAT(YEAR(CURDATE()), '-', LPAD(MONTH(CURDATE()), 2, '0'), '-01' ) AS DATE)) as weekDay, 
    LAST_DAY(CURDATE()) as lastDay 
    UNION ALL 
    SELECT DATE_ADD(itDay, INTERVAL 1 DAY) as itDay, 
    DAYOFWEEK(DATE_ADD(itDay, INTERVAL 1 DAY)) as weekDay, 
    lastDay FROM sundays WHERE itDay<= lastDay 
)SELECT COUNT(*) FROM sundays WHERE weekDay=1;