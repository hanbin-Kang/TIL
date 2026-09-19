-- 년, 월, 성별별로 상품을 구매한 회원수를 집계
-- USER_INFO 테이블의 성별, ONLINE_SALE 테이블의 SALES_DATE
-- USER_ID로 JOIN
SELECT TO_CHAR(O.SALES_DATE, 'YYYY') AS YEAR, 
       TO_CHAR(O.SALES_DATE, 'FMMM') AS MONTH,
       U.GENDER, COUNT(DISTINCT O.USER_ID) AS USERS
FROM ONLINE_SALE O JOIN USER_INFO U
ON O.USER_ID = U.USER_ID
WHERE U.GENDER IS NOT NULL
GROUP BY YEAR, MONTH, GENDER
ORDER BY YEAR ASC, MONTH ASC, GENDER ASC;

-- TO_CHAR을 사용하여 날짜를 추출하면 '숫자'에서 '문자열'이 되지만,
-- EXTRACT를 사용하여 날짜를 추출하면 문자열이 그대로 '숫자'이다.
-- 또한 COUNT(*)을 하지않고 COUNT(DISTINCT U.USER_ID)를 한것은 동일한 회원이 같은 달에 2번을 구매했을 가능성을 제거하기 위해서이다

SELECT     EXTRACT(YEAR FROM s.sales_date) AS year
         , EXTRACT(MONTH FROM s.sales_date) AS month
         , i.gender
         , COUNT(DISTINCT i.user_id) AS users 
        -- 같은 달에 여러 번 구매한 회원이 존재
FROM       user_info i
INNER JOIN online_sale s
           ON i.user_id = s.user_id
WHERE      i.gender IS NOT NULL
GROUP BY   EXTRACT(YEAR FROM s.sales_date)
         , EXTRACT(MONTH FROM s.sales_date)
         , i.gender
ORDER BY   year ASC
         , month ASC
         , i.gender ASC;