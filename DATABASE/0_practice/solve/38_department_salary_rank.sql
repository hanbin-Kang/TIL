-- 윈도우 함수 : 윈도우 함수는 기존 행을 없애거나 합치지 않고, 계산 결과를 새로운 열처럼 붙인다.

-- HR_EMPLOYEES 테이블에서 각 사원의 부서 내 급여 순위를 조회해주세요.
-- 같은 부서에 속한 사원끼리 급여가 높은 순서대로 순위를 매기고, 급여가 같은 사원은 같은 순위를 갖도록 합니다.
-- 사원의 사번, 이름, 부서 코드, 급여와 부서 내 급여 순위를 출력해주세요.
-- 결과는 부서 코드 오름차순, 급여 내림차순으로 정렬해주세요.

SELECT EMP_NO, EMP_NAME, DEPT_CODE, SAL,
       RANK() OVER(
        PARTITION BY DEPT_CODE
        ORDER BY SAL DESC
       ) AS SAL_RANK
FROM HR_EMPLOYEES
ORDER BY DEPT_CODE ASC, SAL DESC;
