-- 부서번호, 부서명, 사원번호, 사원명, 직업, 급여
-- 부서번호가 같은 데이터를 연결할 것
-- 급여가 2500 이상인 사원만 출력
-- 부서번호 오름차순
-- 같은 부서에서는 급여 내림차순
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D. DEPTNO
WHERE SAL >= 2500
ORDER BY E.DEPTNO ASC, E.SAL DESC;

-- 사원번호, 사원명, 급여, 급여 등급, 급여 등급의 최저 급여, 급여 등급의 최고 급여
-- EMP.SAL이 SALGRADE.LOSAL ~ HISAL 범위에 해당하도록 연결
-- 급여가 1000 이상인 사원만 출력
-- 급여 오름차순
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE, S.LOSAL, S.HISAL
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND SAL >= 1000
ORDER BY SAL ASC;

-- 사원번호, 사원명, 직속상관 사원번호, 직속상관 이름, 사원의 급여, 직속상관의 급여
-- 직속상관이 있는 사원만 출력
-- 사원번호 오름차순
SELECT E.EMPNO, E.ENAME, E2.EMPNO AS "MRG_EMPNO", E2.ENAME AS "MGR_ENAME",
       E.SAL, E2.SAL AS "MGR_SAL"
FROM EMP E, EMP E2
WHERE E.MGR = E2.EMPNO
ORDER BY EMPNO ASC;

-- 부서번호, 부서명, 사원번호, 사원명, 직업, 급여
-- 사원이 한 명도 없는 부서도 반드시 출력 
-- 사원이 없는 부서는 사원 관련 정보가 NULL
-- 부서번호 오름차순
-- 같은 부서에서는 사원번호 오름차순
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO, E.EMPNO;

-- 부서번호, 부서명, 사원번호, 사원명, 직업, 급여, 급여 등급, 직속상관 사원번호, 직속상관 이름
-- DEPT와 EMP를 부서번호로 연결
-- EMP의 급여와 SALGRADE의 급여 범위를 이용하여 급여 등급 연결
-- EMP를 SELF JOIN하여 직속상관 정보 연결
-- 직속상관이 없는 사원도 출력
-- 사원이 없는 부서도 출력
-- 부서번호 → 사원번호 순으로 정렬
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL,
       S.GRADE, E2.EMPNO, E2.ENAME
FROM DEPT D LEFT JOIN EMP E
    ON D.DEPTNO = E.DEPTNO -- DEPT테이블 + EMP테이블
LEFT JOIN SALGRADE S
    ON E.SAL BETWEEN S.LOSAL AND S.HISAL -- 거기에 비등가 조인
LEFT JOIN EMP E2
    ON E.MGR = E2.EMPNO -- 거기에 셀프조인
ORDER BY E.DEPTNO, E.EMPNO;

-- 부서번호, 부서명, 사원번호, 사원명, 직업, 급여, 급여등급, 관리자명
-- DEPT와 EMP를 부서번호(DEPTNO) 로 조인한다.
-- EMP와 SALGRADE를 급여 범위를 이용해 조인한다.
-- EMP와 EMP를 셀프 조인하여 관리자의 이름을 출력한다.
-- 사원이 없는 부서도 출력한다. 
-- 관리자가 없는 사원도 출력한다.
-- 부서번호 오름차순 → 사원번호 오름차순으로 정렬한다.
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL,
       S.GRADE, E2.ENAME AS "MGR_ENAME"
FROM DEPT D LEFT JOIN EMP E
    ON D.DEPTNO = E.DEPTNO
LEFT JOIN SALGRADE S
    ON E.SAL BETWEEN S.LOSAL AND S.HISAL
LEFT JOIN EMP E2 
    ON E.MGR = E2.EMPNO
ORDER BY D.DEPTNO, E.EMPNO;

-- 각 부서의 부서번호, 부서명, 사원 수, 급여 합계, 평균 급여, 최고 급여를 출력하시오.
-- DEPT와 EMP를 부서번호로 JOIN
-- 사원이 없는 부서도 출력
-- 평균 급여는 소수점 둘째 자리까지 출력
-- 부서번호 오름차순
SELECT D.DEPTNO, D.DNAME, COUNT(*), SUM(E.SAL), ROUND(AVG(E.SAL), 2), MAX(E.SAL)
FROM DEPT D LEFT JOIN EMP E
    ON D.DEPTNO = E.DEPTNO
GROUP BY D.DEPTNO, D.DNAME
ORDER BY D.DEPTNO ASC;

-- 각 부서의 부서번호, 부서명, 급여등급, 해당 등급의 사원 수를 출력하시오.
-- DEPT와 EMP를 부서번호로 JOIN
-- EMP와 SALGRADE를 급여 범위로 JOIN
-- 각 부서의 급여등급별 사원 수를 구한다.
-- 사원이 없는 부서도 출력
-- 부서번호 → 급여등급 순으로 정렬
SELECT D.DEPTNO, D.DNAME, S.GRADE, COUNT(E.EMPNO)
FROM DEPT D LEFT JOIN EMP E
    ON D.DEPTNO = E.DEPTNO
LEFT JOIN SALGRADE S 
ON E.SAL BETWEEN S.LOSAL AND S.HISAL
GROUP BY D.DEPTNO, D.DNAME, S.GRADE
ORDER BY D.DEPTNO, S.GRADE;

-- 각 부서의 부서번호, 부서명, 사원 수, 평균 급여, 최고 급여를 출력하시오.
-- 평균 급여가 2000 이상인 부서만 출력
-- 사원이 없는 부서는 제외 -> LEFT JOIN X
-- 부서번호 오름차순
SELECT D.DEPTNO, D.DNAME, COUNT(E.EMPNO), AVG(E.SAL), MAX(E.SAL)
FROM DEPT D JOIN EMP E
    ON D.DEPTNO = E.DEPTNO
GROUP BY D.DEPTNO, D.DNAME
HAVING AVG(E.SAL) >= 2000
ORDER BY D.DEPTNO ASC;

-- 부서번호, 부서명, 직업, 사원 수, 평균 급여, 최저 급여, 최고 급여
-- DEPT와 EMP를 JOIN
-- * 같은 부서라도 직업이 다르면 별도의 그룹으로 집계
-- 사원 수가 2명 이상인 그룹만 출력
-- 평균 급여가 높은 순으로 정렬
SELECT D.DEPTNO, D.DNAME, E.JOB, COUNT(E.ENAME), AVG(E.SAL), MIN(E.SAL), MAX(E.SAL)
FROM DEPT D JOIN EMP E
    ON D.DEPTNO = E.DEPTNO
GROUP BY D.DEPTNO, D.DNAME, E.JOB
HAVING COUNT(E.ENAME) >= 2
ORDER BY AVG(E.SAL) DESC;

-- 각 부서의 부서번호, 부서명, 사원 수, 평균 급여, 급여등급 3 이상인 사원 수, 최고 급여를 출력하시오.
-- 평균 급여가 1500 이상인 부서만 출력
-- 사원이 없는 부서는 제외
-- 평균 급여가 높은 순으로 정렬

SELECT D.DEPTNO, D.DNAME, COUNT(E.ENAME), AVG(E.SAL), S.GRADE, MAX(E.SAL)
FROM DEPT D JOIN EMP E
    ON D.DEPTNO = E.DEPTNO
JOIN SALGRADE S
    ON E.SAL BETWEEN S.LOSAL AND S.HISAL
GROUP BY D.DEPTNO, D.DNAME, S.GRADE
HAVING AVG(E.SAL) >= 1500
ORDER BY AVG(E.SAL) DESC;

-- 수정 : COUNT(CASE WHEN S.GRADE >= 3 THEN 1 END)
SELECT D.DEPTNO, D.DNAME, COUNT(E.ENAME), AVG(E.SAL), 
       COUNT(CASE WHEN S.GRADE >= 3 THEN 1 END), MAX(E.SAL)
FROM DEPT D JOIN EMP E
    ON D.DEPTNO = E.DEPTNO
JOIN SALGRADE S
    ON E.SAL BETWEEN S.LOSAL AND S.HISAL
GROUP BY D.DEPTNO, D.DNAME
HAVING AVG(E.SAL) >= 1500
ORDER BY AVG(E.SAL) DESC;
-- 조건부 집계 사용
-- 조건부 집계를 사용하지 않으면 where절에 경우를 넣는데 그때 만족하지 않는 행은 사라져서 잘못된 값을 출력할 수 있음
-- -> 그래서 사용하는것이 조건부 집계