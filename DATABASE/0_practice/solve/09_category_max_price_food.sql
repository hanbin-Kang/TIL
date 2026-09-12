-- 식품분류별로 가격이 가장 비싼 식품의 분류 가격, 이름
-- 분류가 과자, 국, 김치, 식용유인 경우만 / 식품 가격기준 내림차순

SELECT CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE PRICE IN (SELECT MAX(PRICE)
               FROM FOOD_PRODUCT
               WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
               GROUP BY CATEGORY)
AND CATEGORY IN ('과자', '국', '김치', '식용유')
ORDER BY PRICE DESC;
------------------------------------------------------------------------------------------------------------------------------
-- 상관서브쿼리 사용하여 더 깔끔하게 풀어야할듯
SELECT CATEGORY,
       PRICE AS MAX_PRICE,
       PRODUCT_NAME
FROM FOOD_PRODUCT F
WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
AND PRICE = (SELECT MAX(PRICE)
             FROM FOOD_PRODUCT
             WHERE CATEGORY = F.CATEGORY)
ORDER BY PRICE DESC;
-- 바깥 쿼리가 보고 있는 현재 행의 값을, 안쪽 서브쿼리가 가져다 쓰는 것.