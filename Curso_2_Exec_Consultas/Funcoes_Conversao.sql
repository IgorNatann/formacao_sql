USE Executando_Consultas_SQL;

SELECT CONCAT('O faturamento médio bruto foi: ',
              FORMAT(ROUND(AVG(CAST(faturamento_bruto AS DECIMAL(18,4))), 2), 'N2', 'pt-BR')) AS MediaArredondada
FROM faturamento;


