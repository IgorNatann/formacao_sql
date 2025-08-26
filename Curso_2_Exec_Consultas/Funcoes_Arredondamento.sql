SELECT 
    CAST(ROUND(AVG(CAST(faturamento_bruto AS DECIMAL(18,4))), 2) AS DECIMAL(18,2)) AS Media_2_Casas
FROM faturamento;


SELECT 
    AVG(CAST(faturamento_bruto AS DECIMAL(18,2)))             AS MediaDireta,
    ROUND(AVG(CAST(faturamento_bruto AS DECIMAL(18,4))), 2)   AS MediaArredondada
FROM faturamento;

-- CEILING Arredonta para cima.
SELECT CEILING(faturamento_bruto), CEILING(despesas) FROM faturamento;

-- CEILING Arredonta para baixo.
SELECT FLOOR(faturamento_bruto), FLOOR(despesas) FROM faturamento;

