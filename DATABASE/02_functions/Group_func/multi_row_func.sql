-- SUM
SELECT SUM(SAL)
FROM EMP;

SELECT SUM(SAL),
       SUM(ALL SAL), -- SUM(SAL)과 동일한 결과
       SUM(DISTINCT SAL) -- 동일한 급여는 제거 후 계산
FROM EMP;

SELECT SUM(SAL), SUM(COMM)
FROM EMP;

-- COUNT
SELECT COUNT(*) -- EMP 테이블의 데이터 개수 구하기
FROM EMP;

SELECT COUNT(*) AS "부서 번호가 30번인 직원"
FROM EMP
WHERE DEPTNO = 30;

SELECT COUNT(SAL),
       COUNT(DISTINCT SAL) -- SAL중 중복을 제거하고 COUNT
FROM EMP;

SELECT COUNT(*) AS "추가수당 열 구하기 NULL 사용"
FROM EMP
WHERE COMM IS NOT NULL;
 
SELECT COUNT(COMM) 
FROM EMP;

-- MAX, MIN
SELECT MAX(SAL) AS "부서 번호가 10번인 직원에서 가장 높은 급여"
FROM EMP
WHERE DEPTNO = 10;

SELECT MIN(SAL) AS "부서 번호가 10번인 직원에서 가장 낮은 급여"
FROM EMP
WHERE DEPTNO = 10;

-- 부서번호가 20인 사원의 입사일중 가장 최근 입사일 구하기 : 2021-01-01 < 2022-01-01
SELECT TO_CHAR(MAX(HIREDATE), 'YYYY/MM/DD')
FROM EMP
WHERE DEPTNO = 20;
-- 부서번호가 20인 사원의 입사일중 가장 오래된 입사일 구하기
SELECT TO_CHAR(MIN(HIREDATE), 'YYYY/MM/DD')
FROM EMP
WHERE DEPTNO = 20;

-- AVG
SELECT AVG(SAL) AS "부서 번호가 30인 사원들의 평균 급여"
FROM EMP
WHERE DEPTNO = 30;

SELECT AVG(DISTINCT(SAL)) AS "부서 번호가 30인 사원들의 중복을 제거한 평균 급여"
FROM EMP
WHERE DEPTNO = 30;

-- EMP 테이블에서 급여가 1500 이상인 사원들의 급여 합계 평균 급여 최고 급여 최저 급여
SELECT SUM(SAL), AVG(SAL), MAX(SAL), MIN(SAL)
FROM EMP
WHERE SAL >= 1500;

-- EMP 테이블에서 ENAME에 A가 포함된 사원들의 급여를 대상으로 다음을 구하시오.
-- 해당 사원 수/급여 합계/평균 급여/최고 급여/최저 급여
SELECT COUNT(*), SUM(SAL), AVG(SAL), MAX(SAL), MIN(SAL)
FROM EMP
WHERE UPPER(ENAME) LIKE '%A%';