-- ROUND
SELECT ROUND(1234.5678) AS ROUND, -- 소숫점 첫째 자리를 반올림 : 1235
       ROUND(1234.5678, 0) AS ROUND_0, -- 소숫점 0번째 자리를 반올림 : 1235
       ROUND(1234.5678, 1) AS ROUND_1, -- 소숫점 첫째 자리를 반올림 : 1234.6
       ROUND(1234.5678, 2) AS ROUND_2, -- 소숫점 둘째 자리를 반올림 : 1234.57
       ROUND(1234.5678, -1) AS ROUND_MINUS1, -- 소숫점 -1번째 자리를 반올림 : 1230
       ROUND(1234.5678, -2) AS ROUND_MINUS2, -- 소숫점 -2번째 자리를 반올림 : 1200
       ROUND(1617.1234, -3) AS ROUND_MINUS3 -- 소숫점 -3번째 자리를 반올림 : 2000
FROM DUAL;

-- TRUNC
SELECT TRUNC(1234.5678) AS TRUNC, -- 소수점 0 번째 자리까지 남기고 버림 : 1234
       TRUNC(1234.5678, 0) AS TRUNC_0, -- 소수점 0 번째 자리까지 남기고 버림 : 1234
       TRUNC(1234.5678, 1) AS TRUNC_1, -- 소수점 첫 번째 자리까지 남기고 버림 : 1234.5
       TRUNC(1234.5678, 2) AS TRUNC_2, -- 소수점 두 번째 자리까지 남기고 버림 : 1234.56
       TRUNC(1234.5678, -1) AS TRUNC_MINUS1, -- 소수점 -1 번째 자리까지 남기고 버림 : 1230
       TRUNC(1234.5678, -2) AS TRUNC_MINUS2, -- 소수점 -2 번째 자리까지 남기고 버림 : 1200
       TRUNC(1617.1234, -3) AS TRUNC_MINUS3 -- 소수점 -3 번째 자리까지 남기고 버림 : 1000
FROM DUAL;

-- CEIL, FLOOR
SELECT CEIL(3.14), -- 4
       FLOOR(3.14), -- 3
       CEIL(-3.14), -- -3
       FLOOR(-3.14) -- -4
FROM DUAL;

-- MOD : 짝수, 홀수 판단 가능 
SELECT MOD(15, 6), -- 3
       MOD(10, 2), -- 0
       MOD(11, 2) -- 1
FROM DUAL;

-- SYSDATE
SELECT SYSDATE AS NOW,
       SYSDATE - 1 AS YESTERDAY,
       SYSDATE + 1 AS TOMORROW
FROM DUAL;

-- ADD_MONTHS
SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

-- 입사 10주년이 되는 사원들 데이터 출력하기 : 120개월
SELECT *
FROM EMP
WHERE TO_CHAR(ADD_MONTHS(HIREDATE, 120), 'yyyy-mm-dd') = TO_CHAR(SYSDATE, 'yyyy-mm-dd');
-- OR
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
FROM EMP;

-- 입사 32년 미만인 사원 데이터 출력 : 384개월
SELECT * 
FROM EMP
WHERE ADD_MONTHS(HIREDATE, 384) < SYSDATE;

-- MONTHS_BETWEEN
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
       MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1, -- 고용된 날짜 - 오늘 날짜
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2, -- 오늘 날짜 - 고용된 날짜 (일한 일 수)
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3 -- TRUNC(오늘 날짜 - 고용된 날짜) (일한 달의 수)
FROM EMP;

-- NEXT_DAY, LAST_DAY
SELECT SYSDATE, 
       NEXT_DAY(SYSDATE, 'MONDAY'), -- 현재 달을 기준으로 다음에 올 월요일 출력 
       LAST_DAY(SYSDATE) -- 현재 달의 가장 마지막 날짜를 출력
FROM DUAL;

-- 숫자와 문자욜(숫자)을 더하여 출력하기 : 자동 형 변환
SELECT EMPNO, ENAME, EMPNO + '500'
FROM EMP
WHERE ENAME = 'SCOTT';

-- TO_CHAR
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "현재 날짜 시간"
FROM DUAL;

-- 월과 요일을 다양한 형식으로 출력
SELECT TO_CHAR(SYSDATE, 'MM'), -- 달
       TO_CHAR(SYSDATE, 'MON'), -- 월(영어)
       TO_CHAR(SYSDATE, 'MONTH'), -- 월(영어)
       TO_CHAR(SYSDATE, 'DD'), -- 일
       TO_CHAR(SYSDATE, 'DY'), -- 날짜
       TO_CHAR(SYSDATE, 'DAY') -- 날짜
FROM DUAL;

-- TO_NUMBER (명시적 형 변환)
SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
FROM DUAL;

-- TO_DATE
SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
       TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2,
       TO_DATE('20180714', 'YY-MM-DD') AS TODATE3
FROM DUAL;

-- 1981년 6월 1일 이후에 입사한 사원정보 출력
SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE('19810601', 'YYYY/MM/DD');

-- NVL
SELECT EMPNO, ENAME, SAL, COMM, SAL + COMM,
       NVL(COMM, 0), -- COMM의 값이 NULL인 경우 0으로
       SAL + NVL(COMM, 0) -- COMM의 값이 0 인경우 0 + SAL
FROM EMP;

-- NVL
SELECT EMPNO, ENAME, COMM,
       NVL2(COMM, 'O', 'X'), -- COMM이 NULL이 아닐 경우 O로 반환, NULL일 경우 X로 반환
       NVL2(COMM, SAL * 12 + COMM, SAL * 12) AS ANNSAL -- COMM이 NULL이 아닐 경우 SAL * 12 + COMM, NULL일 경우 SAL * 12
FROM EMP;

-- DECODE
SELECT EMPNO, ENAME, JOB, SAL,
       DECODE(JOB,
              'MANAGER', SAL * 1.1, -- JOB이 MANAGER 일때
              'SALESMAN', SAL * 1.05, -- JOB이 SALESMAN 일때
              'ANALYST', SAL, -- JOB이 ANALYST 일때
              SAL * 1.03) AS UPSAL
FROM EMP;

-- CASE : 기준 데이터 있을 때
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
         WHEN 'MANAGER' THEN SAL * 1.1
         WHEN 'SALESMAN' THEN SAL * 1.05
         WHEN 'ANALYST' THEN SAL 
         ELSE SAL * 1.03
    END AS UPSAL -- 별칭
FROM EMP;
-- 기준 데이터 없이 조건식 만으로 CASE문 사용
SELECT EMPNO, ENAME, COMM,
    CASE
        WHEN COMM IS NULL THEN '해당사항 없음'
        WHEN COMM = 0 THEN '수당 없음'
        WHEN COMM > 0 THEN '수당: ' || COMM
    END AS COMM_TEXT
FROM EMP;

-- EMPNO : 사원 이름이 5글자 이상이며 6글자 미민인 사원의 정보출력
-- MASKING_EMPNO : 사원 번호 앞 두 자리 외 뒷자리를 *기호로 출력
-- MASKING_ENAME : 사원 이름 첫글자만 보여주고 나머지는 글자 수 만큼 *로 출력
SELECT EMPNO, 
       RPAD(SUBSTR(EMPNO, 1, 2), LENGTH(EMPNO), '*') AS MASKING_EMPNO, 
       RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) = 5;

-- 평균 근무일 수는 21.5일, 하루 근무 시간을 8시간으로 보고 하루 급여(DAY_PAY), 시급(TIME_PAY)을 계산
-- DAY_PAY : 소수점 세번째 자리에서 버림, TIME_PAY : 두번째 소수점에서 반올림
SELECT TRUNC(SAL / 21.5, 2) AS DAY_PAY, 
       ROUND((SAL / 21.5) / 8, 1) AS TIME_PAY
FROM EMP;

-- 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원 : ADD_MONTHS, NEXT_DAY
-- 사원들이 정직원이 되는 날짜(R-JOB)을 'YYYY-MM-DD'형식으로 출력 : TO_CHAR
-- 추가 수당이 없는 사원은 N/A로 출력 : NVL
SELECT EMPNO, ENAME, HIREDATE,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), 'MONDAY'), 'YYYY-MM-DD') AS "R_JOB", 
       NVL(TO_CHAR(COMM), 'N/A') AS COMM -- TO_CHAR을 해야하는 이유: 'N/V'가 문자열이여서 앞에 것도 문자열로 표시해야함
FROM EMP;

-- 직속 상관의 사원번호가 존재하지 않을 경우 : 0000
-- 직속 상관의 사원번호 앞 두자리가 75인 경우 : 5555
-- 직속 상관의 사원번호 앞 두자리가 76인 경우 : 6666
-- 직속 상관의 사원번호 앞 두자리가 77인 경우 : 7777
-- 직속 상관의 사원번호 앞 두자리가 78인 경우 : 8888
-- 그 외의 번호 : 본래 직속 상관의 번호 사용
SELECT EMPNO, ENAME, MGR,
       CASE 
            WHEN MGR IS NULL THEN '0000'
            WHEN SUBSTR(MGR, 1, 2) = TO_CHAR(75) THEN '5555' 
            WHEN SUBSTR(MGR, 1, 2) = TO_CHAR(76) THEN '6666'
            WHEN SUBSTR(MGR, 1, 2) = TO_CHAR(77) THEN '7777'
            WHEN SUBSTR(MGR, 1, 2) = TO_CHAR(78) THEN '8888'
       ELSE TO_CHAR(MGR)
    END AS "CHG_MRG"
FROM EMP;
-- 앞으로 모든 자료형을 맞춰서 출력해야함