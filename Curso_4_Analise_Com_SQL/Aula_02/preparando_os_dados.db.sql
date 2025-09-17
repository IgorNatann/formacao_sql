SELECT DISTINCT(strftime('%Y', data_venda)) as ANO_VENDAS
FROM vendas
--where data_venda BETWEEN 
ORDER BY ANO_VENDAS;

SELECT DISTINCT(strftime('%Y', data_venda)) as ANO_VENDAS, COUNT(id_venda) AS Total_Vendas
FROM vendas
--where data_venda BETWEEN 
GROUP BY ANO_VENDAS	
ORDER BY ANO_VENDAS;

SELECT (strftime('%Y', data_venda)) AS Ano, strftime('%m', data_venda) AS Mes ,COUNT(id_venda) AS Total_Vendas
FROM vendas
GROUP BY Ano, Mes
ORDER BY Ano;
