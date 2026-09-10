-- REST_INFO 테이블에서 음식 종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류, id, 식당이름, 즐겨찾기수를 조회하는 SQL/ 음식종류를 기준으로 내림차순

-- 1. 음식의 종류별로 가장 많은 즐겨찾기수를 받은 식당이름을 구한 후 (서브쿼리)
SELECT FOOD_TYPE, MAX(FAVORITES)
FROM REST_INFO
GROUP BY FOOD_TYPE;
-- 2. 메인쿼리에서 식당이름이 같은 곳을 골라 출력
SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) IN (SELECT FOOD_TYPE, MAX(FAVORITES)
                                FROM REST_INFO
                                GROUP BY FOOD_TYPE)
ORDER BY FOOD_TYPE DESC;
-- 처음에 WHERE절에 =을 사용하였는데 여러 값이 반환되는 서브쿼리이기 때문에 =대신 in을 사용