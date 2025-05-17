WINDOW FUNCTIONS BASICALLY DO THE GROUPING WITHOUT GROUP BY (EXPENSIVE BUT ESSENTIAL)


📊 Aggregate functions (used as window functions):

SUM() – Total over a window
AVG() – Average over a window
MIN() – Minimum value in the window
MAX() – Maximum value in the window
COUNT() – Count of rows in the window

🔢 Ranking functions:

ROW_NUMBER() – Unique row number per window
RANK() – Ranking with gaps (like 1, 2, 2, 4)
DENSE_RANK() – Ranking without gaps (like 1, 2, 2, 3)
NTILE(n) – Splits rows into n buckets/bands -- NTILE(n) is like dividing student scores into equal bands or ranges, for example, 1-10, 11-20, 21-30, etc., based on their rank/order.

    -- -- EXAMPLE OF NTILE
    -- SELECT 
    -- student_name, 
    -- score, 
    -- NTILE(10) OVER (ORDER BY score DESC) AS score_band
    -- FROM 
    -- students;

🕰️ Value functions (for comparing row values):

LAG(column, offset, default_value) – Value from a previous row -- opposite of LEAD
LEAD(column, offset, default_value) – Value from a following row -- opposite of LAG 
FIRST_VALUE(column) – First value in the window -- opposite of LAST_VALUE 
LAST_VALUE(column) – Last value in the window -- opposite of FIRST_VALUE
NTH_VALUE(column, n) – Nth value in the window

OKAY SO GROUPING DATA BY NOTHING WOULD LOOK LIKE 
    EG: SELECT emp_name, total_sale, SUM(total_sale) OVER() -- this will show each employees sales over the total sales in the company







CUME_DIST() = Rank of the current row / Total number of rows
PERCENT_RANK() = (Rank of the current row - 1) / (Total number of rows - 1)
