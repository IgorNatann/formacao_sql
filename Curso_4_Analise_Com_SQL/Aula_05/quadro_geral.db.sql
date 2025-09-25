-- Quadro Geral
SELECT 
    STRFTIME('%Y/%m', data_venda) AS 'Ano/Mes', 
    COUNT(*) AS QTD_Vendas 
FROM vendas 
GROUP BY STRFTIME('%Y/%m', data_venda) 
ORDER BY STRFTIME('%Y/%m', data_venda);


