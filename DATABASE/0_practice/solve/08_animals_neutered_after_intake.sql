-- 들어올때 중성화 x -> 나갈 때 o
--               -> 나갈 때 x

-- 두 테이블을 join하여 중성화 여부를 확인
SELECT I.ANIMAL_ID, I.ANIMAL_TYPE, I.NAME
FROM ANIMAL_INS I JOIN ANIMAL_OUTS O
ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE I.SEX_UPON_INTAKE LIKE 'Intact %'
AND (O.SEX_UPON_OUTCOME LIKE 'Spayed %' OR 
     O.SEX_UPON_OUTCOME LIKE 'Neutered %')
ORDER BY I.ANIMAL_ID ASC;
