-- 없어진 기록을 찾는것 NOT IN을 사용
-- 입양을 간 기록은 있는데, 보호소에 들어온 기록이 x/ 동물의 ID와 이름을 ID 순으로 조회하는 SQL

-- 보호소애 들어온 기록 (서브쿼리)
-- SELECT ANIMAL_ID
-- FROM ANIMAL_INS;

-- 메인쿼리 입양간 기록
SELECT ANIMAL_ID, NAME
FROM ANIMAL_OUTS
WHERE ANIMAL_ID NOT IN (SELECT ANIMAL_ID
                        FROM ANIMAL_INS)
ORDER BY ANIMAL_ID ASC, NAME ASC;

-- IN = 보호소에 들어온 기록, OUT = 보호소에서 나간(입양된) 기록.
-- OUT에 있지만 IN에 없는 동물 → 없어진 기록 / IN에 있지만 OUT에 없는 동물 → 아직 입양되지 않은 동물.