-- 2022-05-01을 기준으로 주문 ID, 제품 ID, 출고일자, 출고여부를 조회하는 SQL문
-- 출고여부는 2022년 5월 1일까지 출고완료로 이 후 날짜는 출고 대기로 미정이면 출고미정
SELECT ORDER_ID, PRODUCT_ID, TO_CHAR(OUT_DATE, 'YYYY-MM-DD'), 
    CASE 
        WHEN OUT_DATE <= DATE '2022-05-01' THEN '출고완료'
        WHEN OUT_DATE > DATE '2022-05-01' THEN '출고대기'
        ELSE '출고미정'
    END AS "출고여부"
FROM FOOD_ORDER
ORDER BY ORDER_ID ASC;