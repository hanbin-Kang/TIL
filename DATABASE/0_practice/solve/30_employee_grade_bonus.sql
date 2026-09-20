-- 평가 점수별 등급과, 등급에 따른 성과금 - 사번, 성명, 평가 등급, 성과금
SELECT E.EMP_NO, E.EMP_NAME, 
       -- 등급을 결정하는 CASE문, 1분기와 2분기의 점수의 평균
       CASE
        WHEN AVG(G.SCORE) >= 96 THEN 'S'
        WHEN AVG(G.SCORE) >= 90 THEN 'A'
        WHEN AVG(G.SCORE) >= 80 THEN 'B'
        ELSE 'C'
       END AS GRADE, 
       -- 보상금을 결정하는 CASE문, 등급별 보너스를 구분
       CASE 
        WHEN AVG(G.SCORE) >= 96 THEN E.SAL * 0.2
        WHEN AVG(G.SCORE) >= 90 THEN E.SAL * 0.15
        WHEN AVG(G.SCORE) >= 80 THEN E.SAL * 0.1
        ELSE 0
       END AS BONUS
FROM HR_EMPLOYEES E JOIN HR_GRADE G
ON E.EMP_NO = G.EMP_NO
GROUP BY E.EMP_NO, E.EMP_NAME
ORDER BY E.EMP_NO ASC;

------------------------------------------------------------------------------------------------------------
-- WITH절을 사용하여 보다 GRADE의 재사용
-- WITH절 : 복잡한 SELECT 결과에 이름을 붙여서 뒤의 SELECT에서 임시 테이블처럼 사용하는 방법

WITH GRADING AS (
    SELECT E.EMP_NO,
           E.EMP_NAME,
           E.SAL,
           CASE
               WHEN AVG(G.SCORE) >= 96 THEN 'S'
               WHEN AVG(G.SCORE) >= 90 THEN 'A'
               WHEN AVG(G.SCORE) >= 80 THEN 'B'
               ELSE 'C'
           END AS GRADE
    FROM HR_EMPLOYEES E
    JOIN HR_GRADE G
      ON E.EMP_NO = G.EMP_NO
    GROUP BY E.EMP_NO, E.EMP_NAME, E.SAL
)
SELECT EMP_NO,
       EMP_NAME,
       GRADE,
       CASE
           WHEN GRADE = 'S' THEN SAL * 0.2
           WHEN GRADE = 'A' THEN SAL * 0.15
           WHEN GRADE = 'B' THEN SAL * 0.1
           ELSE 0
       END AS BONUS
FROM GRADING
ORDER BY EMP_NO ASC;