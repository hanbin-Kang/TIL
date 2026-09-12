-- 서브쿼리를 사용하여 조회수가 가장 높은 것의 BOARD_ID를 찾고
-- 메인쿼리는 join을 하여 문제에서 원하는 조건으로 맞춘 후 출력
SELECT '/home/grep/src/' || B.BOARD_ID || '/' || F.FILE_ID || F.FILE_NAME ||F.FILE_EXT AS "FILE_PATH"
FROM USED_GOODS_BOARD B JOIN USED_GOODS_FILE F
ON B.BOARD_ID = F.BOARD_ID
WHERE B.VIEWS IN (SELECT MAX(VIEWS)
                  FROM USED_GOODS_BOARD) 
ORDER BY F.FILE_ID DESC;
-- 최대 조회수를 구하는 문제였는데, 최대 조회수는 하나만이라고 가정하고 들어가서 시간이 오래걸렸다
-- 동일한 조회수를 가진것이 여러개일수도 있다라는것을 생각해야함