COMMON FORMAT CODES IN PostgreSQL

    Format Code	Meaning
    YYYY	4-digit year
    YY	2-digit year
    MM	2-digit month
    Month	Full month name
    Mon	Abbreviated month
    DD	Day of month
    HH24	Hour (24-hour)
    MI	Minutes
    SS	Seconds
    Day	Full day name



BROADER COMPARISON OF DATE METHODS IN MySQL, PostgreSQL and, Oracle

+-----------------------------+---------------------------------------------+---------------------------------------------+----------------------------------------------+
|           Task             |                  MySQL                      |               PostgreSQL                    |                   Oracle                      |
+-----------------------------+---------------------------------------------+---------------------------------------------+----------------------------------------------+
| Format YYYY-MM-DD          | DATE_FORMAT(NOW(), '%Y-%m-%d')              | TO_CHAR(NOW(), 'YYYY-MM-DD')               | TO_CHAR(SYSDATE, 'YYYY-MM-DD')               |
| Format DD/MM/YYYY          | DATE_FORMAT(NOW(), '%d/%m/%Y')              | TO_CHAR(NOW(), 'DD/MM/YYYY')               | TO_CHAR(SYSDATE, 'DD/MM/YYYY')               |
| Format Month YYYY          | DATE_FORMAT(NOW(), '%M %Y')                 | TO_CHAR(NOW(), 'Month YYYY')               | TO_CHAR(SYSDATE, 'Month YYYY')               |
| Format Date + Time         | DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i')        | TO_CHAR(NOW(), 'YYYY-MM-DD HH24:MI')       | TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI')       |
+-----------------------------+---------------------------------------------+---------------------------------------------+----------------------------------------------+
| Extract Year               | YEAR(NOW())                                 | EXTRACT(YEAR FROM NOW())                   | EXTRACT(YEAR FROM SYSDATE)                   |
| Extract Month              | MONTH(NOW())                                | EXTRACT(MONTH FROM NOW())                  | EXTRACT(MONTH FROM SYSDATE)                  |
| Extract Day                | DAY(NOW())                                  | EXTRACT(DAY FROM NOW())                    | EXTRACT(DAY FROM SYSDATE)                    |
| Extract Weekday Name       | DAYNAME(NOW())                              | TO_CHAR(NOW(), 'Day')                      | TO_CHAR(SYSDATE, 'Day')                      |
+-----------------------------+---------------------------------------------+---------------------------------------------+----------------------------------------------+
| Truncate to Month          | DATE_FORMAT(NOW(), '%Y-%m-01')              | DATE_TRUNC('month', NOW())                 | TRUNC(SYSDATE, 'MM')                         |
| Truncate to Day            | DATE(NOW())                                 | DATE_TRUNC('day', NOW())                   | TRUNC(SYSDATE)                               |
| Truncate to Year           | DATE_FORMAT(NOW(), '%Y-01-01')              | DATE_TRUNC('year', NOW())                  | TRUNC(SYSDATE, 'YYYY')                       |
+-----------------------------+---------------------------------------------+---------------------------------------------+----------------------------------------------+
| Add Days                   | NOW() + INTERVAL 7 DAY                      | NOW() + INTERVAL '7 days'                  | SYSDATE + 7                                  |
| Subtract 1 Month           | NOW() - INTERVAL 1 MONTH                    | NOW() - INTERVAL '1 month'                 | ADD_MONTHS(SYSDATE, -1)                      |
| Difference in Days         | DATEDIFF(NOW(), '2024-01-01')               | NOW()::date - '2024-01-01'::date           | SYSDATE - TO_DATE('2024-01-01', 'YYYY-MM-DD')|
+-----------------------------+---------------------------------------------+---------------------------------------------+----------------------------------------------+
| Parse Date '2024-12-01'    | STR_TO_DATE('2024-12-01', '%Y-%m-%d')       | '2024-12-01'::date                         | TO_DATE('2024-12-01', 'YYYY-MM-DD')          |
| Parse DateTime             | STR_TO_DATE('2024-12-01 14:30',             | TO_TIMESTAMP('2024-12-01 14:30',           | TO_DATE('2024-12-01 14:30',                  |
|                             | '%Y-%m-%d %H:%i')                           | 'YYYY-MM-DD HH24:MI')                      | 'YYYY-MM-DD HH24:MI')                        |
+-----------------------------+---------------------------------------------+---------------------------------------------+----------------------------------------------+
