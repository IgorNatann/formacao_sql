SELECT (strftime('%Y', data_venda)) AS Ano, strftime('%m', data_venda) AS Mes, COUNT(id_venda) AS Total_Vendas
FROM vendas
WHERE Mes IN ('01','11','12')
GROUP BY Ano, Mes
ORDER BY Ano;
















