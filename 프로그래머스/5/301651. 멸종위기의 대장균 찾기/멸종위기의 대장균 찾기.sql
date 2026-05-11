WITH RECURSIVE T AS (
    -- 1세대(루트)
    SELECT ID, PARENT_ID, 1 AS GENERATION -- 1세대 명칭 부여
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL -- PARENT_ID가 NULL인 개체 즉, 부모 개체를 찾음.
  UNION ALL -- 테이블을 세로로 이어붙임.
    -- 하위 세대
    SELECT E.ID, E.PARENT_ID, T.GENERATION + 1 -- 부모 세대에 +1을 하여 다음 세대 명칭 부여. 
    FROM ECOLI_DATA E
    JOIN T ON E.PARENT_ID = T.ID -- 자식 개체의 부모 ID를 ID로 갖는 개체 즉, 부모-자식 연결 
)
SELECT
    COUNT(*) AS COUNT,
    GENERATION
FROM T
LEFT JOIN ECOLI_DATA C         -- 자식 존재 여부 확인
       ON C.PARENT_ID = T.ID
WHERE C.ID IS NULL              -- 자식이 없으면 leaf
GROUP BY GENERATION -- 세대별로 그룹화
ORDER BY GENERATION; -- 1세대부터 오름차순 정렬