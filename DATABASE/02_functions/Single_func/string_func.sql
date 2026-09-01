-- UPPER, LOWER, INITCAP 
SELECT ENAME, UPPER(ENAME) AS "UPPER", LOWER(ENAME) AS "LOWER", INITCAP(ENAME) AS "INITCAP"
FROM EMP;

-- 사용 이유
SELECT *
FROM EMP
WHERE UPPER(ENAME) = UPPER('scott');

SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('%scott%');

-- LENGTH 
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

-- 사원 이름의 길이가 5글자 이상인 행 출력
SELECT ENAME 
FROM EMP
WHERE LENGTH(ENAME) >= 5;
-- 직책이 6글자 이상인 사원 출력
SELECT *
FROM EMP
WHERE LENGTH(JOB) >= 6;

-- SUBSTR
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
FROM EMP;

-- 사원 이름을 세번째 글자부터 끝까지 출력
SELECT SUBSTR(ENAME, 3)
FROM EMP;

-- INSTR + UPPER
SELECT INSTR(UPPER('Hello, Oracle'), 'L') AS "INSTR_1", 
       INSTR(UPPER('Hello, Oracle'), 'L', 5) AS "INSTR_2",
       INSTR(UPPER('Hello, Oracle'), 'L', 2, 2) AS "INSTR_3"
FROM DUAL;

-- 사원 이름에 문자 S가 있는 행 구하기 : INSTR 사용
SELECT *
FROM EMP
WHERE INSTR(LOWER(ENAME), 's') > 0; 

-- 사원 이름에 문자 S가 있는 행 구하기 : LIKE 사용
SELECT *
FROM EMP
WHERE LOWER(ENAME) LIKE '%s%';

-- REPLACE 
SELECT '010-1234-5678' AS "REPLACE_BEFORE",
        REPLACE('010-1234-5678', '-', ' ') AS "REPLACE_1",
        REPLACE('010-1234-5678', '-') AS "REPLACE_2"
FROM DUAL;

-- LPAD, RPAD
SELECT 'Oracle',
        LPAD('Oracle', 10, '#') AS "LPAD_1",
        RPAD('Oracle', 10, '*') AS "RPAD_1",
        LPAD('Oracle', 10) AS "LPAD_2",
        RPAD('Oracle', 10) AS "RPAD_2"
FROM DUAL;

-- RPAP 함수를 사용하여 개인정보 뒷자리 *표시로 출력하기
SELECT RPAD('030723-', 14, '*'),
       RPAD('010-5373-', 13, '*')
FROM DUAL;

-- CONCAT
SELECT CONCAT(EMPNO, ENAME),
       CONCAT(EMPNO, CONCAT(' : ', ENAME))
FROM EMP
WHERE LOWER(ENAME) = 'scott';
-- CONCAT와 같은 역할을 하는 ||
SELECT EMPNO || ENAME,
       EMPNO || (' : ' || ENAME)
FROM EMP
WHERE LOWER(ENAME) = 'scott';

-- TRIM
SELECT '[' || TRIM('_' FROM '_ _Oracle_ _') || ']' AS TRIM, -- 앞뒤 다 제거
       '[' || TRIM(LEADING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_LEADING, -- LEADING : 선두의 
       '[' || TRIM(TRAILING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_TRAILING, -- TRAILING : 뒤쪽의
       '[' || TRIM(BOTH '_' FROM '_ _Oracle_ _') || ']' AS TRIM_BOTH -- 기본값과 같이 앞뒤 다 제거
FROM DUAL;

-- LTRIM, RTRIM
SELECT '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
       '[' || LTRIM('<_Oracle_>', '_<') || ']' AS LTRIM_2, -- '_<' 이라는 문자열을 삭제하는게 아닌 각각의 문자를 삭제하는 것
       '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
       '[' || RTRIM('<_Oracle_>', '>_') || ']' AS RTRIM_2  -- '>_' 이라는 문자열을 삭제하는게 아닌 각각의 문자를 삭제하는 것
FROM DUAL;