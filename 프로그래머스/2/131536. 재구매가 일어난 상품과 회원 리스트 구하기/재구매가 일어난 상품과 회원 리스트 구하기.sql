-- 코드를 입력하세요
SELECT      USER_ID, PRODUCT_ID
FROM        ONLINE_SALE
GROUP BY    USER_ID, PRODUCT_ID
HAVING      COUNT(*) > 1 -- USER_ID와 PRODUCT_ID로 그룹화된 행의 수(한 행은 한 유저가 특정 제품을 구매한 내역이므로, COUNT 시 재구매한 경우는 1보다 큰 값이 나옴.)
ORDER BY    USER_ID, PRODUCT_ID DESC;