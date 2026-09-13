-- 공간을 2개 이상 등록한 유저를 찾아 출력 -> HOST_ID의 수가 2개 이상인 경우

-- 서브쿼리 : 공간을 두개 이상 등록한 HOST_ID
-- SELECT HOST_ID
-- FROM PLACES
-- GROUP BY HOST_ID
-- HAVING COUNT(*) >= 2

-- 메인쿼리 : 서브쿼리를 활용하여 출력
SELECT ID, NAME, HOST_ID
FROM PLACES
WHERE HOST_ID IN (SELECT HOST_ID
                  FROM PLACES
                  GROUP BY HOST_ID
                  HAVING COUNT(*) >= 2)
ORDER BY ID ASC;