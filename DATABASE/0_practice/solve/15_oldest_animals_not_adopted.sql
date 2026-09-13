-- 아직 입양 못간 동물중 가장 오래 보호소에 있었던 동물 3마라의 이름, 보호 시작일
-- 보호 시작일 순으로 조회 : 오름차순

-- INS 테이블의 DATETIME, NAME
-- INS 테이블에는 있고 OUTS 테이블에는 없는 동물 : 입양 X

-- 입양간 동물의 ID
-- SELECT ANIMAL_ID
-- FROM ANIMAL_OUTS

-- 입양을 가지 못한 동물의 ID
-- SELECT ANIMAL_ID
-- FROM ANIMAL_INS 
-- WHERE ANIMAL_ID NOT IN (SELECT ANIMAL_ID
--                         FROM ANIMAL_OUTS)

-- 출력 
SELECT NAME, DATETIME
FROM ANIMAL_INS
WHERE ANIMAL_ID IN (SELECT ANIMAL_ID
                    FROM ANIMAL_INS 
                    WHERE ANIMAL_ID NOT IN (SELECT ANIMAL_ID
                                            FROM ANIMAL_OUTS))
ORDER BY DATETIME ASC
FETCH FIRST 3 ROWS ONLY;

-- 서브쿼리 부분을 WHERE ANIMAL_ID NOT IN (SELECT ANIMAL_ID FROM ANIMAL_OUTS)로 줄일 수 있음