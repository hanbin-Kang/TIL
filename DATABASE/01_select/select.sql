-- 테이블 부분 열 출력하기
SELECT EMPNO, ENAME, DEPTNO
FROM EMP;

-- 중복의 데이터를 삭제하는 DISTINCT : 중복되는 것을 삭제하고 중복되지 않은 것들만 출력, 파이썬의 set() 느낌
SELECT DISTINCT DEPTNO
FROM EMP;
-- 여러개가 있을 때는 모두 중복된 데이터만 삭제 (JOB의 열 + DEPTNO열 둘다 중복되는 것)
SELECT DISTINCT JOB, DEPTNO
FROM EMP;

-- 별칭 설정 : AS (alios)
SELECT ENAME, SAL, SAL*12+COMM AS "ANNSAL", COMM 
FROM EMP; -- COMM의 값이 NULL이면 ANNSAL의 값도 NULL

-- ORDER BY : 원하는 순서대로 출력 데이터를 정렬하는 방법 (SELECT문의 가장 마지막에 사용)
SELECT *
FROM EMP
ORDER BY SAL ASC; -- SAL(급여)를 기준으로 작은것부터 큰것으로 (오름차순) .. 생략가능

SELECT *
FROM EMP
ORDER BY SAL DESC; -- SAL(급여)를 기준으로 큰것부터 작은것으로 (내림차순)

-- 각각의 열에 내림차순과 오름차순 동시 사용
SELECT *
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC; -- DEPTNO(부서 번호)를 기준으로 오름차순을 하고 
                               -- 부서 번호가 같은 사람들은 SAL(급여)를 기준으로 내림차순

