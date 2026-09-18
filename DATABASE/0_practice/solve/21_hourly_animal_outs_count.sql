-- 09:00 ~ 19:59까지 시간대별로 입양이 몇건이 됐냐
SELECT TO_NUMBER(TO_CHAR(DATETIME, 'FMHH24')) AS HOUR, COUNT(*) AS COUNT
FROM ANIMAL_OUTS
HAVING HOUR BETWEEN 9 AND 19
GROUP BY HOUR
ORDER BY HOUR ASC;
-- FM : 필요없는 0같은것 없애 주는 명령어 ex) 09 -> 9
-- TO_CHAR로만 하고 ORDER BY 했을때는 문자열이여서 원하는대로 순서가 출력되지 않았지만, NUMBER로 바꾼 후 출력하니 원하는것처럼 출력이 됐다
