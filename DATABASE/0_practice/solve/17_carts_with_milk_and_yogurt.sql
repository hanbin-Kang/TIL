-- 우유와 요거트를 동시에 구입한 장바구니의 아이디
-- 장바구니 아이디순으로

-- 우유를 담은 카트의 아이디 조회
-- SELECT CART_ID
-- FROM CART_PRODUCTS
-- WHERE NAME = 'Milk'

-- 요거트를 담은 카트중에서 우유를 담은 카트와 동일한 카트 ID 출력
SELECT DISTINCT CART_ID
FROM CART_PRODUCTS
WHERE NAME = 'Yogurt'
AND CART_ID IN (SELECT CART_ID
                FROM CART_PRODUCTS
                WHERE NAME = 'Milk')
ORDER BY CART_ID ASC;