-- USED_GOODS_BOARD 테이블에서 작성한 글이 3개가 넘으면, USED_GOODS_USER에 있는 아이디, 이름, 주소, 전화번호 등을 조회하는 SQL/아이디 기준 내림차순

-- 1. WRITER_ID별로 그룹화 하여 3개가 넘는 사람만 출력하는 서브쿼리
SELECT WRITER_ID
FROM USED_GOODS_BOARD
GROUP BY WRITER_ID
HAVING COUNT(BOARD_ID) >= 3;
-- 2. 메인쿼리에서 조건에 맞게 출력 
SELECT USER_ID, NICKNAME, 
       CITY || ' ' || STREET_ADDRESS1 || ' ' || STREET_ADDRESS2 AS "전체주소",
       SUBSTR(TLNO, 1, 3) || '-' || SUBSTR(TLNO, 4, 4) || '-' || 
       SUBSTR(TLNO, 8) AS "전화번호"
FROM USED_GOODS_USER
WHERE USER_ID IN (SELECT WRITER_ID
                  FROM USED_GOODS_BOARD
                  GROUP BY WRITER_ID
                  HAVING COUNT(BOARD_ID) >= 3)
ORDER BY USER_ID DESC;
-- 문자여서 SUBSTR사용, 숫자면 TO_CHAR(x, 'FM000-0000-0000')을 사용