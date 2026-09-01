-- GROUP BY
SELECT DEPTNO, AVG(SAL) --각 그룹별 평균 급여가 얼마인지 나눌 수 있음
FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO, JOB, AVG(SAL) -- 부서 번호 및 직책별 평균 급여로 정렬
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;
-- LOGIC: GROUP BY에 명시되어 있는 부서 번호로 그룹을 먼저 묶은 후 그룹 내에서 사원 직책 열을 기준으로 다시 소그룹으로 묶어 급여 평균 출력
-- 각 부서 내에서 직책별로 그룹을 나누고, 각 직책 그룹의 평균 급여를 구한다.

-- EMP 테이블에서 각 부서별 직책별 평균 급여와 사원 수를 구하시오.
-- 조건:
-- 1. 부서 번호를 출력한다. DEPTNO
-- 2. 직책을 출력한다. JOB
-- 3. 각 그룹의 평균 급여를 출력한다. AVG(SAL)
-- 4. 각 그룹의 사원 수를 출력한다. COUNT(*)
-- 5. 결과는 부서 번호 → 직책 순서로 정렬한다. ORDER BY
SELECT DEPTNO, JOB, AVG(SAL), COUNT(*)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- EMP 테이블에서 각 직책별 급여 통계를 구하시오.
-- 직책/서로 다른 급여의 개수/전체 급여 합계/평균 급여/최고 급여/최저 급여
-- 단, 이름에 A가 포함된 사원만 대상으로 한다.
-- 결과는 평균 급여가 낮은 순서로 정렬한다.
SELECT JOB, COUNT(DISTINCT SAL), SUM(SAL), AVG(SAL), MAX(SAL), MIN(SAL)
FROM EMP
WHERE UPPER(ENAME) LIKE '%A%'
GROUP BY JOB
ORDER BY AVG(SAL) ASC;
-- LOGIC :
-- 1. 이름에 A가 포함된 사원만 WHERE로 필터링
-- 2. 필터링된 사원을 JOB별로 그룹화
-- 3. 각 JOB 그룹에서 급여의 개수, 합계, 평균, 최대값, 최소값을 계산
-- 4. 평균 급여가 낮은 순서로 정렬

-- HAVING
-- 각 부서의 직책별 평균 급여를 구하되, 그 평균 급여가 2000이상인 그룹만 출력
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL <= 3000 -- 1. 급여가 3000 초과인 사원은 제외
GROUP BY DEPTNO, JOB -- 2. 부서 번호, 직책으로 그룹화
HAVING AVG(SAL) >= 2000 -- 3. 그룹별 평균 급여가 2000이상인 그룹만 출력
ORDER BY DEPTNO, JOB;

-- 부서별 직챙의 평균 급여가 500 이상인 사원들의 부서 번호, 직책, 부서별 직책의 평균급여
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 500
ORDER BY DEPTNO, JOB;