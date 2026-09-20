-- 더 이상 업그레이드 할 수 없는 아이템의 ID, 이름, 희귀도를 출력
-- ID 기준 내림차순

-- 더 이상 업그레이드 할 수 없는 아이템 : NULL이 아니고, 아이템 ID가 PARENT_ITEM_ID이 아닐때

SELECT I.ITEM_ID, I.ITEM_NAME, I.RARITY
FROM ITEM_INFO I JOIN ITEM_TREE T
ON I.ITEM_ID = T.ITEM_ID
WHERE T.ITEM_ID NOT IN (SELECT PARENT_ITEM_ID
                        FROM ITEM_TREE
                        WHERE PARENT_ITEM_ID IS NOT NULL)
ORDER BY I.ITEM_ID DESC;