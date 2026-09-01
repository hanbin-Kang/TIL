-- 부서 번호, 평균 급여, 최고 급여, 최저 급여, 사원수를 출력
-- 단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서 번호별로 출력
SELECT DEPTNO, TRUNC(AVG(SAL)) AS "AVG_SAL", MAX(SAL) AS "MAX_SAL", MIN(SAL) AS "MIN_SAL", COUNT(EMPNO) AS "CNT"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO DESC;

-- 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력 : 직책별로 인원수를 카운트, 3명이 기준
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;

-- 사원들의 입사 연도를 기준으로 부서별로 몇명이 입사했는지 출력
SELECT TO_CHAR(HIREDATE, 'YYYY'), DEPTNO, COUNT(*)
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;

-- 추가 수당을 받는 사원의 수와 받지 못하는 사원의 수를 구하여라
-- 추가 수당을 기준으로 : CASE WHEN THEN
SELECT CASE
            WHEN COMM IS NULL THEN 'X'
            ELSE 'O'
       END AS "EXIST_COMM",
       COUNT(*) AS "CNT"
FROM EMP
GROUP BY EXIST_COMM;

-- 각 부서별 급여 총합을 구하시오.
-- 단, 직원이 3명 이상/급여 총합이 8,000 이상인 부서만 출력하시오. : HAVING
SELECT DEPTNO, COUNT(*) AS "EMP_COUNT" ,SUM(SAL) AS "TOTAL_SAL"
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) >= 3 AND SUM(SAL) >= 8000;
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT순이여서 SELECT에서 선언한 별칭을 HAVING에 사용 x