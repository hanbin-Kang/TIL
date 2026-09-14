-- 리뷰를 가장 많이 작성한 회원의 글 개수 : 3
-- SELECT COUNT(REVIEW_TEXT)
-- FROM REST_REVIEW
-- GROUP BY MEMBER_ID
-- ORDER BY COUNT(REVIEW_TEXT) DESC
-- FETCH FIRST 1 ROW ONLY
                     
-- 회원 ID조회
-- SELECT MEMBER_ID
-- FROM REST_REVIEW
-- GROUP BY MEMBER_ID
-- HAVING COUNT(REVIEW_TEXT) = (SELECT COUNT(REVIEW_TEXT)
--                              FROM REST_REVIEW
--                              GROUP BY MEMBER_ID
--                              ORDER BY COUNT(REVIEW_TEXT) DESC
--                              FETCH FIRST 1 ROW ONLY)

-- 출력
SELECT P.MEMBER_NAME, R.REVIEW_TEXT, TO_CHAR(R.REVIEW_DATE, 'YYYY-MM-DD') AS REVIEW_DATE
FROM MEMBER_PROFILE P JOIN REST_REVIEW R
ON R.MEMBER_ID = P.MEMBER_ID
WHERE R.MEMBER_ID IN (SELECT MEMBER_ID
                      FROM REST_REVIEW
                      GROUP BY MEMBER_ID
                      HAVING COUNT(REVIEW_TEXT) = (SELECT COUNT(REVIEW_TEXT)
                                                   FROM REST_REVIEW
                                                   GROUP BY MEMBER_ID
                                                   ORDER BY COUNT(REVIEW_TEXT) DESC
                                                   FETCH FIRST 1 ROW ONLY))
ORDER BY REVIEW_DATE, R.REVIEW_TEXT