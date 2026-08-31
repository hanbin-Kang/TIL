-- 사원 이름이 5글자 이상 : LENGTH(ENAME) >= 5
-- 이름의 첫 글자만 표시하고 나머지는 *로 마스킹 : RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*')
-- 사원번호도 앞 두 자리만 표시하고 나머지는 * : RPAD, SUBSTR
-- 입사일로부터 3개월 후 첫 번째 월요일을 구함 : ADD_MONTHS, NEXT_DAY
-- 해당 날짜를 YYYY-MM-DD 형식으로 출력 : TO_CHAR
-- COMM이 NULL이면 N/A 출력 : NVL
-- JOB에 따라 급여를 계산 : CASE
-- MANAGER → 10% 인상
-- SALESMAN → 5% 인상
-- ANALYST → 인상 없음
-- 그 외 → 3% 인상
-- 모든 반환값의 자료형이 맞도록 처리
SELECT EMPNO, RPAD(SUBSTR(EMPNO, 1, 2), LENGTH(EMPNO), '*') AS MASKING_EMPNO,
       ENAME, RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME,
       HIREDATE,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), 'MONDAY'), 'YYYY-MM-DD') AS "R_JOB", 
       NVL(TO_CHAR(COMM), 'N/A') AS COMM,
       CASE JOB
            WHEN 'MANAGER' THEN SAL * 1.1
            WHEN 'SALESMAN' THEN SAL * 1.05
            WHEN 'ANALYST' THEN SAL
            ELSE SAL * 1.03
       END AS UPSAL
FROM EMP
WHERE LENGTH(ENAME) >= 5;

-- ENAME을 대문자로 출력 : UPPER
-- ENAME의 첫 글자와 마지막 글자를 추출하여 다음 형태로 출력 (S...H) : 첫글자와 마지막 글자만 그대로, 나머지 글자는 .처리
-- ENAME의 길이가 5이면 5글자, 6이면 6글자, 그 외에는 기타로 표시 : CASE LENGTH(ENAME)
-- JOB을 소문자로 변환하여 출력 : LOWER
-- JOB의 길이를 출력 : LENGTH
-- EMPNO | ENAME | NAME_FORMAT | NAME_SIZE | JOB | JOB_LENGTH
SELECT EMPNO, 
       ENAME, 
       RPAD(SUBSTR(UPPER(ENAME), 1, 1), LENGTH(ENAME) - 1, '.') || SUBSTR(UPPER(ENAME), LENGTH(ENAME)) AS "ENAME_FORMAT",
       CASE 
            WHEN LENGTH(ENAME) = 5 THEN '5글자'
            WHEN LENGTH(ENAME) = 6 THEN '6글자'
            ELSE '기타'
       END AS "NAME_SIZE",
       LOWER(JOB),
       LENGTH(JOB) AS "JOB_LENGTH"
FROM EMP;

-- EMPNO : 7369 → 73**
-- ENAME : SMITH → S***H
-- JOB : M******R

-- 입사일로부터 3개월 후 첫 번째 월요일을 구한다.
-- 현재 날짜 기준 근속 개월 수를 구하고, 소수점은 제거한다.

-- SAL : 3,000 / 2,450

-- SAL >= 3000 → HIGH
-- SAL >= 2000 → MIDDLE
-- SAL >= 1000 → LOW
-- 그 외 → VERY LOW

-- COMM IS NULL → N/A
-- COMM = 0 → NO COMM
-- COMM > 0 → COMM: 금액

-- 근속기간 >= 120개월
-- AND
-- SAL >= 2000
-- → SENIOR

-- 근속기간 >= 60개월
-- AND
-- SAL >= 2000
-- → MID

-- 그 외
-- → JUNIOR

SELECT EMPNO, RPAD(SUBSTR(EMPNO, 1, 2), LENGTH(EMPNO), '*') AS "MASKING_EMPNO", 
       ENAME, RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME) - 1, '*') || SUBSTR(ENAME, LENGTH(ENAME)) AS "MASKING_ENAME", 
       JOB, RPAD(SUBSTR(JOB, 1, 1), LENGTH(JOB) - 1, '*') || SUBSTR(JOB, LENGTH(JOB)) AS "MASKING_JOB",
       HIREDATE,
       NEXT_DAY(ADD_MONTHS(HIREDATE, 3), 'MONDAY') AS "R_JOB",
    --    TRUNC((SYSDATE - HIREDATE) / 365) AS "WORK_MONTHS",
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "WORK_MONTHS",
       TO_CHAR(SAL, '9,999') AS SAL_TEXT,
       CASE 
            WHEN SAL >= 3000 THEN 'HIGH'
            WHEN SAL >= 2000 THEN 'MIDDLE'
            WHEN SAL >= 1000 THEN 'LOW'
       ELSE 'VERY LOW'
       END AS "SAL_GRADE",

       CASE 
            WHEN COMM IS NULL THEN 'N/A'
            WHEN COMM = 0 THEN 'NO COMM'
            WHEN COMM > 0 THEN 'COMM: ' || COMM
       END AS "COMM_TEXT",

       CASE
            WHEN ADD_MONTHS(HIREDATE, 120) <= SYSDATE AND SAL >= 2000 THEN 'SENIOR'
            WHEN ADD_MONTHS(HIREDATE, 60) <= SYSDATE AND SAL >= 2000 THEN 'MID'
            ELSE 'JUNIOR'
       END AS "EMP_GRADE"
FROM EMP;