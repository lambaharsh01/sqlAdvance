-- PROBLEM STATEMENT
-- The issue in your original table is duplicate category pairs with different orderings. For example:
-- Books | Clothing and Clothing | Books represent the same category pair, but both exist separately.
-- Likewise, Electronics | Sports and Sports | Electronics.
-- Since the pair is unordered, it should only appear once, regardless of the column order.


-- GOAL
-- You want to remove duplicate pairs that are just reversed versions of each other, and only keep one

>> Sort each pair (c1, c2) lexicographically.
>> Use that sorted pair as a unique key.
>> Keep only one instance of each sorted pair.

-- soo that now there are 2 number of pairs as there were but now we have duplicates in the same row,
-- so that they can now be grouped or be pruned using algorithms 


| c1          | c2          | customer_count |
| ----------- | ----------- | -------------- |
| Books       | Clothing    | 3              |
| Books       | Electronics | 3              |
| Clothing    | Books       | 3              |
| Clothing    | Electronics | 3              |
| Electronics | Books       | 3              |
| Electronics | Clothing    | 3              |
| Electronics | Sports      | 3              |
| Sports      | Electronics | 3              |


WITH uc AS (
    SELECT DISTINCT pp.user_id , pi.category
    FROM ProductPurchases pp 
    JOIN ProductInfo pi ON pi.product_id = pp.product_id
), agg AS (
    SELECT  
        t1.category AS c1,
        t2.category AS c2,
        COUNT(*) AS customer_count
    FROM uc t1 
    JOIN uc t2 ON t2.user_id = t1.user_id AND t1.category != t2.category
    GROUP BY t1.category, t2.category HAVING COUNT(*) > 2
)SELECT
    LEAST(c1, c2) AS category1,
    GREATEST(c1, c2) AS category2,
    customer_count
FROM agg 
ORDER BY customer_count DESC, category1, category2

-- NOW THE LEAST AND GREATEST DOES THIS ad gets the duplicates in the same row


| c1          | c2          | customer_count |
| ----------- | ----------- | -------------- |
| Books       | Clothing    | 3              |
| Books       | Electronics | 3              |
| Books       | Clothing    | 3              |
| Clothing    | Electronics | 3              |
| Books       | Electronics | 3              |
| Clothing    | Electronics | 3              |
| Electronics | Sports      | 3              |
| Electronics | Sports      | 3              |


-- USING DISTINCT WITH THIS QUERY NOW REMOVES ALL THE DUPLICATE VALUES


| c1          | c2          | customer_count |
| ----------- | ----------- | -------------- |
| Books       | Clothing    | 3              |
| Books       | Electronics | 3              |
| Clothing    | Electronics | 3              |
| Electronics | Sports      | 3              |