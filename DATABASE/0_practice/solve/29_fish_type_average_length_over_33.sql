-- 평균 길이가 33cm 이상인 물고기들을 종류별로 분류하여
-- 잡은 수, 최대 길이, 물고기 종류를 출력. 
-- 10cm 이하의 물고기들은 10cm으로 취급하여 평균길이

SELECT COUNT(*) AS FISH_COUNT,
       MAX(LENGTH) AS MAX_LENGTH,
       FISH_TYPE
FROM FISH_INFO
WHERE FISH_TYPE IN (
                    -- 평균 길이가 33cm 이상인 물고기 종류 찾기
                    SELECT FISH_TYPE
                    FROM FISH_INFO
                    GROUP BY FISH_TYPE
                    HAVING AVG(
                        -- 10cm 이하인 물고기는 10cm로 계산
                        CASE
                            WHEN LENGTH > 10 THEN LENGTH
                            ELSE 10
                        END
                    ) >= 33
)
-- 물고기 종류별 잡은 수와 최대 길이 계산
GROUP BY FISH_TYPE
ORDER BY FISH_TYPE ASC;
