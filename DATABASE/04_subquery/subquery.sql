-- 급여가 JONES보다 높은 사원 조회
-- JONES의 급여를 구하는 것 : 서브쿼리
-- JONES보다 급여가 높은 사원 : 메인쿼리
SELECT SAL
FROM EMP
WHERE ENAME = 'JONES';
-- 위의 SELECT문은 서브쿼리 밑에 SELECT문은 메인쿼리이다
SELECT *
FROM EMP
WHERE SAL > (SELECT SAL
             FROM EMP
             WHERE ENAME = 'JONES')
ORDER BY SAL ASC;

-- SCOTT보다 빨리 입사한 사원의 목록을 조회 (단일행 서브쿼리와 날짜 데이터)
-- SCOTT의 입사일 (서브쿼리)
SELECT HIREDATE
FROM EMP
WHERE ENAME = 'SCOTT';

-- 메인쿼리
SELECT *
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE
                  FROM EMP
                  WHERE ENAME = 'SCOTT')
ORDER BY HIREDATE ASC;

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 정보, 소속부서 정보 (단일행 서브쿼리와 함수)
-- 전체 사원의 평균 급여 (서브쿼리)
SELECT AVG(SAL)
FROM EMP;

-- (메인 쿼리) 20번 부서의 속한 사원 중 ~ : join + 서브쿼리 + 함수
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 20
AND E.SAL > (SELECT AVG(SAL)
           FROM EMP);

-- 전체 사원의 평균 급여보다 작거나 같은 급여를 받고 있는 20번 부서의 사원 및 부서의 정보를 구하여라
-- 전체 사원의 평균 급여 (서브쿼리 + 함수)
SELECT AVG(SAL)
FROM EMP;

-- 메인쿼리
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 20
AND E.SAL <= (SELECT AVG(SAL)
              FROM EMP);

-- 다중행 서브쿼리
-- 각 부서별 최고 급여를 받는 사원을 조회(서브쿼리)
SELECT MAX(SAL)
FROM EMP
GROUP BY DEPTNO;
-- 메인쿼리
SELECT *
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
              FROM EMP
              GROUP BY DEPTNO);

-- 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 정보 출력
-- 30번 부서의 최대 급여 (서브쿼리)
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 30;

-- 보다 적은 급여를 받는 사원정보
SELECT *
FROM EMP
WHERE SAL < (SELECT MAX(SAL)
             FROM EMP
             WHERE DEPTNO = 30);

-- VS
SELECT *
FROM EMP
WHERE SAL < ANY (SELECT SAL
                 FROM EMP
                 WHERE DEPTNO);

-- 다중열 서브쿼리
SELECT *
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);
-- (부서번호, 급여) IN (부서번호, 부서별 급여 최대값) 부서별로 누가 최대 급여를 받는지 묻는 다중열 서브쿼리 문제

-- 인라인 뷰
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10, -- E10은 전체중 부서번호가 10인 것 
     (SELECT * FROM DEPT) D -- D는 DEPT테이블의 전체
WHERE E10.DEPTNO = D.DEPTNO; 
-- DEPT테이블 전체에서 부서번호가 10인것을 추출

-- WITH절
WITH 
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D   AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;

-- SELECT절에 사용하는 서브쿼리
SELECT EMPNO,ENAME, JOB, SAL,
       (SELECT GRADE
        FROM SALGRADE
        WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
        DEPTNO,
        (SELECT DNAME
         FROM DEPT
         WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM EMP E;

-- 1번 : ALLEN과 같은 직책인 사원들의 사원정보, 부서정보를 출력
-- 서브쿼리 : ALLEN의 직책을 구함
SELECT JOB
FROM EMP
WHERE ENAME = 'ALLEN';

SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = (SELECT JOB
               FROM EMP
               WHERE ENAME = 'ALLEN');

-- 2번 : 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보, 부서정보, 급여등급을 출력
-- 서브쿼리 : 전체 사원의 평균 급여
SELECT AVG(SAL)
FROM EMP;

SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE S
ON E.SAL BETWEEN LOSAL AND HISAL
WHERE E.SAL > (SELECT AVG(SAL)
             FROM EMP);
-- GRADE를 JOIN할 때 주의!

-- 3번 : 10번 부서에서 근무하는 사원중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 사원정보, 부서정보 출력
-- 서브쿼리 : 30번 부서에 근무하는 사원들의 직책
SELECT JOB
FROM EMP
WHERE DEPTNO = 30;

-- 10번 부서에는 존재하지 않는 직책을 가진 사원들의 사원 정보, 부서정보
SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 10
AND E.JOB NOT IN (SELECT JOB
                    FROM EMP
                    WHERE DEPTNO = 30);

-- 4번 : 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원정보, 급여등급 출력
-- SALESMAN의 최고 급여를 구함
SELECT MAX(SAL)
FROM EMP
WHERE JOB = 'SALESMAN';

SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN LOSAL AND HISAL
WHERE E.SAL > (SELECT MAX(SAL)
               FROM EMP
               WHERE JOB = 'SALESMAN');