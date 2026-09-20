-- MySql

-- 2022년에 한해 평가 점수가 가장 높은 사원 정보를 조회 -> 1분기 + 2분기를 합쳐야함
-- 사원 점수가 가장 높은 사원들의 점수, 사번, 성명, 직책, 이메일 조회

-- HR_EMPLOYEES JOIN HR_GRADE / EMP_NO

SELECT SUM(G.SCORE), E.EMP_NO, E.EMP_NAME, E.POSITION, E.EMAIL
FROM HR_EMPLOYEES E JOIN HR_GRADE G
ON E.EMP_NO = G.EMP_NO
GROUP BY EMP_NO
ORDER BY SUM(SCORE) DESC
-- LIMIT 1;

