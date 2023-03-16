1) what is total amount of each customer spent on zomato?
SELECT a.userid,sum(b.price) total_amt_spent from SALES a inner join product b on a.product_id = b.product_id
group by a.userid

SELECT* FROM SALES
2) How many days has each customer visited zomato ?
SELECT * FROM sales
SELECT userid,COUNT(DISTINCT CREATED_DATE) DISTINCT_DAYS FROM SALES GROUP BY userid
3)What was the first product purchased by each customer ?
SELECT* FROM
(SELECT * , RANK() OVER(PARTITION BY USERID ORDER BY CREATED_DATE) RNK FROM SALES) A WHERE RNK =1

4) What is the most purchased item on the menu and how many times it purchased by all customers?
 SELECT PRODUCT_ID,COUNT(PRODUCT_ID) CNT FROM SALES GROUP BY PRODUCT_ID ORDER BY COUNT(PRODUCT_ID) DESC LIMIT 1

5) Which item was the most popular for each customer ?
SELECT * FROM
(SELECT *,RANK() OVER(PARTITION BY USERID ORDER BY CNT DESC) RNK FROM
(SELECT USERID,PRODUCT_ID,COUNT(PRODUCT_ID) CNT FROM SALES GROUP BY USERID,PRODUCT_ID)A)B
WHERE RNK = 1







