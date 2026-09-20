-- 종류 별로 가장 큰 물고기의 ID, 물고기 이름, 길이를 출력
-- 종류별로 길이가 가장 긴 물고기ID를 구한 후 출력

-- 서브쿼리 : 물고기 종류와 최대 길이
-- SELECT FISH_TYPE, MAX(LENGTH)
-- FROM FISH_INFO
-- GROUP BY FISH_TYPE
-- ORDER BY ID ASC;

SELECT I.ID, N.FISH_NAME, I.LENGTH
FROM FISH_INFO I JOIN FISH_NAME_INFO N
ON I.FISH_TYPE = N.FISH_TYPE
WHERE (I.FISH_TYPE, I.LENGTH) IN (SELECT FISH_TYPE, MAX(LENGTH)
                                  FROM FISH_INFO
                                  GROUP BY FISH_TYPE)
ORDER BY ID ASC;