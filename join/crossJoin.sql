1. WHEN CROSS JOINED t1 WITH m ROWS AND t2 WITH n ROWS THE RESULT SIZE IS m * n ROWS
2. CROSS JOIN DOES NOT HAVE ANY ON CONDITION IMPLEMENTED
3. TO PROTECT SAME COLUMN TO BE JOINED WITH THE SAME COLUMN IN A SELF JOIN USE t1.col1 != t2.col1 (IF CROSS JOIN)

USE CASE WITH CROSS JOINS 
    COMBINING TABLE  tab    id   num
                            1    100
                            2    200
                            3    300
    WITH ITSELF WITH A QUERY : SELECT 
                                    t1.id, 
                                    t2.id, 
                                    t1.num, 
                                    t2.num
                                FROM tab t1 
                                CROSS JOIN tab t2

    RESULT  id  id  num  num  (tab WITH 3 ROWS RESPONSE OF (3*3) = 9 rows)
            3	1	300	 100
            2	1	200	 100
            1	1	100	 100
            3	2	300	 200
            2	2	200	 200
            1	2	100	 200
            3	3	300	 300
            2	3	200	 300
            1	3	100	 300

    HERE SAME ID ARE BEING CROSS JOINED TO THE SAME ID ITSELF (1 1, 2 2, 3 3)

    NOW TO GET THE ROWS WITH NOT THE SAME ROW CROSS JOINED WITH ITSELF: SELECT 
                                                                            t1.id, 
                                                                            t2.id, 
                                                                            t1.num, 
                                                                            t2.num
                                                                        FROM tab t1 
                                                                        CROSS JOIN tab t2
                                                                        WHERE t1.id != t2.id -- only applicable in a self or fk cross joined environment
    
    RESULT  id  id  num  num  (tab WITH 3 ROWS RESPONSE OF (3*3) - 3 = 9 rows) ONLY IN CASE OF A SELF JOIN OR A JOIN WHERE THE CROSS JOINED TABLES COULD HAVE SIMILAR VALUE (i.e FK CONSTRAINT)
            3	1	300	 100
            2	1	200	 100
            3	2	300	 200
            1	2	100	 200
            2	3	200	 300
            1	3	100	 300

    

    NOW TO GET THE DISTINCT VALUE of t1.id t1.num, t2.num:  SELECT DISTINCT 
                                                                t1.id, 
                                                                t2.id,
                                                                LEAST(t1.num, t2.num) AS num,
                                                                GREATEST(t1.num, t2.num) AS num
                                                            FROM tab t1 
                                                            CROSS JOIN tab t2
                                                            WHERE t1.id != t2.id AND t1.num != t2.num

    RESULT  id  id  num   num  ALL THE UNIQUE JOINS AFTER 
            1	2	100	  200
            1	3	100	  300
            2	1	100	  200
            2	3	200	  300
            3	1	100	  300
            3	2	200	  300

    




    



SELECT DISTINCT t1.user_id, 
    LEAST(t1.product_id, t2.product_id) AS l,
    GREATEST(t1.product_id, t2.product_id) AS g
    
FROM ProductPurchases t1
CROSS JOIN ProductPurchases t2
WHERE t1.user_id = t2.user_id AND
t1.product_id != t2.product_id