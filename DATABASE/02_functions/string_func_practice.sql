-- 문제 1 — 사원명 검색 및 가공 : 사원 이름에 문자 A 또는 a가 포함된 사원을 조회하시오.
SELECT *
FROM EMP
WHERE ENAME LIKE '%A%'
   OR ENAME LIKE '%a%';
-- ------------------------------------------------------------------------------------------
-- 문제 2 — 직책 분석 : 직책(JOB)에 문자 E가 포함된 사원을 조회하시오.
SELECT *
FROM EMP
WHERE JOB LIKE '%E%';
-- ------------------------------------------------------------------------------------------
-- 문제 3 — 사원명 마스킹 : SMITH -> S****
SELECT RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME) - 1, '*')
FROM EMP;
-- ------------------------------------------------------------------------------------------
-- 문제 4 — 전화번호 마스킹 : 010-1234-5678 -> 010-1234-****
SELECT RPAD('010-1234-', LENGTH('010-1234-5678'), '*')
FROM DUAL;
-- ------------------------------------------------------------------------------------------
-- 문제 5 — 사원 정보 조합 : 7499 : ALLEN (SALESMAN)
-- 5-1) || 사용
SELECT EMPNO ||' : ' || ENAME || ' (' || JOB || ')' AS INFO_EMP
FROM EMP;
-- 5-2) CONCAT 사용
SELECT CONCAT(EMPNO, ' : ', ENAME, ' (', JOB, ')')
FROM EMP;
-- ------------------------------------------------------------------------------------------
-- 문제 6 - 사원 이름의 첫 번째 글자와 마지막 글자만 출력 : SMITH -> SH
SELECT SUBSTR(ENAME, 1, 1) || SUBSTR(ENAME, LENGTH(ENAME), LENGTH(ENAME))
FROM EMP;
-- 수정: SUBSTR의 마지막 LENGTH(ENAME)은 필요 없음
-- ------------------------------------------------------------------------------------------
-- 문제 7 — 문자열 검색 + 가공 : 사원 이름에 S가 포함된 사원 + SMITH -> SMI(3글자만)
SELECT SUBSTR(ENAME,1, 3)
FROM EMP
WHERE UPPER(ENAME) LIKE '%S%';
-- ------------------------------------------------------------------------------------------
-- 문제 8 — 직책 마스킹 : PRESIDENT -> P********
SELECT RPAD(SUBSTR(JOB, 1, 1), LENGTH(JOB), '*')
FROM EMP;
-- ------------------------------------------------------------------------------------------
-- 문제 9 — 문자열 위치를 이용한 가공 : 사원 이름에서 문자 A가 처음 등장하는 위치를 구하고, 그 위치부터 끝까지 출력하시오.
SELECT ENAME, INSTR(ENAME, 'A') AS "POSITION", SUBSTR(ENAME, INSTR(UPPER(ENAME), 'A')) AS "RESULT"
FROM EMP
WHERE UPPER(ENAME) LIKE '%A%';
-- ------------------------------------------------------------------------------------------
-- 10번 
-- EMPNO   EMPLOYEE_INFO
-- ------  ----------------------------
-- 7499    [A] ALLEN - SALESMAN / LEN:5
SELECT EMPNO, CONCAT('[', SUBSTR(ENAME, 1, 1), '] ', 
                     ENAME, ' - ', JOB, ' / ', 
                     'LEN:', LENGTH(ENAME)) AS "EMPLOYEE_INFO"
FROM EMP;
-- ------------------------------------------------------------------------------------------
-- 11번 : 조건 + 검색 + 마스킹
-- 사원 이름에 S가 포함된 사원만 출력하시오.
-- EMPNO   RESULT
-- ------  -------------------------
-- 7369    S**** / CLERK / POS:1
-- 7566    J**** / MANAGER / POS:4
SELECT EMPNO, CONCAT(RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') ,' / ', JOB, 
                     ' / ', 'POS', ':', INSTR(ENAME, "S")) 
                     AS "RESULT"
FROM EMP
WHERE UPPER(ENAME) LIKE '%S%';
-- ------------------------------------------------------------------------------------------
-- 문제 12 : 이름 마스킹 + 특정 문자 위치, 사원 이름에 S가 포함된 사원만 출력하시오.
-- EMPNO   RESULT
-- ------  ----------------------------
-- 7369    S**** / S_POS:1 / LEN:5
SELECT EMPNO, RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') || ' / ' ||
                    'S_POS:' || INSTR(UPPER(ENAME), 'S') || ' / ' || 'LEN:' || LENGTH(ENAME) AS "RESULT"
FROM EMP
WHERE UPPER(ENAME) LIKE '%S%';
-- ------------------------------------------------------------------------------------------
-- 문제 13 : 이름 앞뒤 추출
-- EMPNO   RESULT
-- ------  --------------------
-- 7369    S...H / LEN:5
SELECT EMPNO, RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME) - 1, '.') || SUBSTR(ENAME, LENGTH(ENAME))
       || ' / LEN:' || LENGTH(ENAME)
FROM EMP;
-- ------------------------------------------------------------------------------------------
-- 문제 14 : JOB 마스킹 + 이름 검색
-- 직책에 문자 A가 포함된 사원만 출력하시오.
-- EMPNO   RESULT
-- ------  ----------------------------
-- 7499    ALLEN / S******* / A_POS:2
SELECT EMPNO, ENAME || ' / ' || RPAD(SUBSTR(JOB, 1, 1), LENGTH(JOB), '*') || ' / A_POS:' || INSTR(UPPER(JOB), 'A')AS "RESULT"
FROM EMP
WHERE UPPER(JOB) LIKE '%A%';
-- ------------------------------------------------------------------------------------------
-- 문제 15 : 문자열 변환 - SMITH → SMI-TH
SELECT SUBSTR(ENAME, 1, 3) || '-' || SUBSTR(ENAME, 4)
FROM EMP;
-- ------------------------------------------------------------------------------------------
-- 문제 16 : EMP에서 이름에 S가 포함된 사원만 출력하시오.
-- EMPNO   RESULT
-- ------  ------------------------------------------
-- 7369    [S] S**** | S_POS:1 | LEN:5 | JOB:C****
SELECT EMPNO, '[' || SUBSTR(ENAME, 1, 1) || ']' || RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*')
       || ' | ' || 'S_POS:' || INSTR(UPPER(ENAME), 'S') || ' | ' || 'LEN:' || LENGTH(ENAME) 
       || ' | ' || 'JOB:' || RPAD(SUBSTR(JOB, 1, 1), LENGTH(JOB), '*') AS "RESULT"
FROM EMP
WHERE UPPER(ENAME) LIKE '%S%';
-- ------------------------------------------------------------------------------------------
-- 틀린 문제 
-- (1) 3번
SELECT RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*')
FROM EMP;
-- RPAD(문자열, 최종길이, 채울문자)

-- (2) 11번
 SELECT EMPNO, CONCAT(RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') ,' / ', JOB, 
                     ' / ', 'POS', ':', INSTR(UPPER(ENAME), 'S')) 
                     AS "RESULT"
FROM EMP
WHERE UPPER(ENAME) LIKE '%S%';
-- 문자열은 작은 따옴표로