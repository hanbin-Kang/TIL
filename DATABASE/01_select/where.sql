-- DB의 where절은 Python의 if절과 비슷

-- 부서 번호가 30인 데이터만 출력하기 
SElECT *
FROM EMP
WHERE DEPTNO = 30;

-- 부서 번호가 30번이고, 직업이 'SALESMAN'일 때 : 둘 다 참인 경우만 출력
SELECT *
FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

-- 부서 번호가 30번이거나 직업이 CLERK일 때 : 둘 중 하나만 참인 경우도 출력
SELECT *
FROM EMP
WHERE DEPTNO = 30
OR JOB = 'CLERK';

-- 연산자의 종류

-- 급여에 12를 곱한 값이 36000인 행 출력 : 산술 연산자 (+, -, *, /)
SELECT *
FROM EMP
WHERE (SAL * 12) = 36000;

-- 급여가 3000 이상인 사원을 출력 : 대소 비교 연사자(>, <, >=, <=)
SELECT *
FROM EMP
WHERE SAL >= 3000;

-- 문자열을 대소 비교 연산자로 비교하기 : FORZ라는 사원보다 알파벳이 앞에 있는 사원 출력 (사전식)
SELECT *
FROM EMP
WHERE ENAME <= 'FORZ';

-- 등가 비교 연산자 (= / <>, !=, ^=)

-- 급여가 3000과 같지 않은 경우 출력
SELECT *
FROM EMP
WHERE SAL <> 3000; -- WHERE NOT SAL = 3000;

-- in 연산자를 활용하여
SELECT *
FROM EMP
WHERE JOB IN ('SALESMAN', 'MANAGER', 'CLERK');

-- 급여가 2000과 3000 사이인 사원 : BETWEEN A AND B 사용
SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

-- 이름이 S로 시작되는 사원 (% : 뒤에 몇글자가 오던 상관 x)
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

-- 이름의 두번째 글자가 L인 사원 구하기 (_ : 앞이나 뒤에 몇글자가 올 지 지정)
SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

-- 사원 이르메 AM이 포함되어있는 사원 출력
SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

-- NULL : 값이 존재 x -> 비교 x

-- 추가 수당이 NULL값인 사원들을 출력 : is 연산자 사용
SELECT *
FROM EMP
WHERE COMM IS NULL;

-- 직속 상관이 있는 사원들 출력
SELECT * 
FROM EMP
WHERE MGR IS NOT NULL;

-- 집합 연산자 (UNION) : 출력 열 개수, 자료형이 같아야함 / 중복 제거
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10

UNION -- DEPTNO가 10인 행과 DEPTNO가 20인 행을 합쳐 출력

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;

-- UNION(합집합, 중복 제거), UNION ALL(합집합, 중복 제거 x), MINUS(차집합), INTERSECT(교집합)

-- 부서 번호가 10인 사원을 제외한 사원들 출력 
SELECT * 
FROM EMP

MINUS

SELECT *
FROM EMP
WHERE DEPTNO = 10;

-- 전체에서 부서 번호가 10인 사원을 출력
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP

INTERSECT

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;