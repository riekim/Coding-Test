SELECT 
    ID, 
    CASE 
        WHEN P_RANK <= 0.25 THEN 'CRITICAL'
        WHEN P_RANK <= 0.50 THEN 'HIGH'
        WHEN P_RANK <= 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS COLONY_NAME
FROM (
    SELECT 
        ID, 
        /* 크기 내림차순 기준 백분위 순위를 구합니다 (0 ~ 1 사이 값) */
        PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS P_RANK
    FROM ECOLI_DATA
) AS S
ORDER BY ID ASC;