-- Métricas

-- Consulta 1.
SELECT
COUNT(*) AS QTD_Vendas,
STRFTIME('%Y', v.data_venda) AS Ano
FROM vendas v
WHERE STRFTIME('%m', v.data_venda) = '11' AND Ano != '2022'  
GROUP BY Ano;

-- Consulta 2 com SubConsulta (média de vendas)

SELECT
AVG(QTD_Vendas) AS Media_QTD_Vendas
FROM (
  SELECT
  COUNT(*) AS QTD_Vendas,
  STRFTIME('%Y', v.data_venda) AS Ano
  FROM vendas v
  WHERE STRFTIME('%m', v.data_venda) = '11' AND Ano != '2022'  
  GROUP BY Ano
 );
 
 -- Consulta 3
 
 SELECT
 COUNT(*) AS QTD_Vendas,
 STRFTIME('%Y', v.data_venda) AS Ano
 FROM vendas v
 WHERE STRFTIME('%m', v.data_venda) = '11' AND Ano = '2022'  
 GROUP BY Ano
 
 -- Consulta 4
 
SELECT 
QTD_Vendas AS Vendas_Atual
from (
 SELECT
 COUNT(*) AS QTD_Vendas,
 STRFTIME('%Y', v.data_venda) AS Ano
 FROM vendas v
 WHERE STRFTIME('%m', v.data_venda) = '11' AND Ano = '2022'  
 GROUP BY Ano
 );
 
 -- Consulta 5 com IF
with Media_Vendas_Anteriores AS (
  SELECT
  AVG(QTD_Vendas) AS Media_QTD_Vendas
  FROM (
   SELECT
   COUNT(*) AS QTD_Vendas,
   STRFTIME('%Y', v.data_venda) AS Ano
   FROM vendas v
   WHERE STRFTIME('%m', v.data_venda) = '11' AND Ano != '2022'  
   GROUP BY Ano
)), Vendas_Atual AS (
  SELECT 
  QTD_Vendas AS Vendas_Atual
  from (
   SELECT
   COUNT(*) AS QTD_Vendas,
   STRFTIME('%Y', v.data_venda) AS Ano
   FROM vendas v
   WHERE STRFTIME('%m', v.data_venda) = '11' AND Ano = '2022'  
   GROUP BY Ano
))
SELECT 
MVA.Media_QTD_Vendas,
VA.Vendas_Atual,
ROUND((VA.Vendas_Atual - MVA.Media_QTD_Vendas) / MVA.Media_QTD_Vendas * 100.0, 2) || '%' as Porcentagem
FROM Vendas_Atual VA, Media_Vendas_Anteriores MVA
;
 
 
 
 
 
 
 
 
 
 
 
 