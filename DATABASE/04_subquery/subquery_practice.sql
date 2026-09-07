-- 'ALLEN'과 같은 직책을 가진 사원의 사원번호, 사원 이름, 직책, 급여를 출력하시오.
-- ALLEN의 직책
SELECT JOB
FROM EMP
WHERE ENAME = 'ALLEN';

SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE ENAME = 'ALLEN');
--------------------------------------------------------------------------------------------------------------
-- 전체 사원의 평균 급여보다 높은 급여를 받는 사원의 사원번호, 이름, 급여를 출력하시오.
-- 전체 사원의 평균 급여
SELECT AVG(SAL)
FROM EMP;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
             FROM EMP);
--------------------------------------------------------------------------------------------------------------
-- 'JONES'와 같은 부서에서 근무하는 사원의 사원번호, 이름, 직책, 부서번호, 부서 이름을 출력하시오.
-- JONES가 근무하는 곳
SELECT DEPTNO
FROM EMP
WHERE ENAME = 'JONES';

SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = (SELECT DEPTNO
                  FROM EMP
                  WHERE ENAME = 'JONES');
--------------------------------------------------------------------------------------------------------------
-- 30번 부서에서 근무하는 사원들과 같은 직책을 가진 사원의 사원번호, 이름, 직책, 급여를 출력하시오.
-- 30번 부서에 근무하는 사람들의 직책
SELECT JOB
FROM EMP
WHERE DEPTNO = 30;

SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE JOB IN (SELECT JOB
              FROM EMP
              WHERE DEPTNO = 30);
--------------------------------------------------------------------------------------------------------------
-- 10번 부서에서 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원의 사원번호, 이름, 직책을 출력하시오.
-- 30번 부서의 직책
SELECT JOB
FROM EMP
WHERE DEPTNO = 30;

SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE DEPTNO = 10
AND JOB NOT IN (SELECT JOB
            FROM EMP
            WHERE DEPTNO = 30);
--------------------------------------------------------------------------------------------------------------
-- 30번 부서에서 근무하는 사원들의 급여 중 어느 하나보다 높은 급여를 받는 사원의 사원번호, 이름, 급여를 출력하시오. 
-- 30번 부서의 급여 꼴지보다 많이 받는 사람 출력
SELECT MIN(SAL)
FROM EMP
WHERE DEPTNO = 30;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT MIN(SAL)
             FROM EMP
             WHERE DEPTNO = 30);

-- ANY 사용
-- SELECT EMPNO, ENAME, SAL
-- FROM EMP
-- WHERE SAL > ANY (
--     SELECT SAL
--     FROM EMP
--     WHERE DEPTNO = 30);
--------------------------------------------------------------------------------------------------------------
-- 그리고 30번 부서에서 근무하는 모든 사원의 급여보다 높은 급여를 받는 사원도 같은 방식으로 작성하시오. 
-- 30번 부서중 가장 높은 급여를 받는 사람보다 더 많이 받는 사원 출력 
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 30;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
             FROM EMP
             WHERE DEPTNO = 30);

-- ALL 사용
-- SELECT EMPNO, ENAME, SAL
-- FROM EMP
-- WHERE SAL > ALL (
--     SELECT SAL
--     FROM EMP
--     WHERE DEPTNO = 30);
--------------------------------------------------------------------------------------------------------------
-- 'SCOTT'과 같은 부서이면서 같은 직책을 가진 사원의 사원번호, 이름, 직책, 부서번호를 출력하시오.
-- SOCTT의 부서 구하기
SELECT DEPTNO, JOB
FROM EMP
WHERE ENAME = 'SCOTT';

SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'SCOTT')
AND JOB = (SELECT JOB
           FROM EMP
           WHERE ENAME = 'SCOTT');

-- 다중 서브쿼리로 해결
-- WHERE (DEPTNO, JOB) IN (
--     SELECT DEPTNO, JOB
--     FROM EMP
--     WHERE ENAME = 'SCOTT')
--------------------------------------------------------------------------------------------------------------
-- 각 부서별 평균 급여를 먼저 구한 후, 그중에서 평균 급여가 2000 이상인 부서만 출력하시오.
-- 부서별 평균 급여
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) > 2000;

-- FROM절에 서브쿼리
-- FROM (
--     SELECT DEPTNO, AVG(SAL)
--     FROM EMP
--     GROUP BY DEPTNO)
     