-- 1. Análise de Marcas:
--Modifique a consulta para calcular a porcentagem de vendas de cada marca de produtos.
--Substitua as junções e seleções para focar nas marcas em vez de categorias.
SELECT Nome_Marca, Qtd_Vendas, ROUND(100.0*Qtd_Vendas/(SELECT COUNT(*) FROM itens_venda), 2) || '%' AS Porcentagem
FROM(
    SELECT m.nome AS Nome_Marca, COUNT(iv.produto_id) AS Qtd_Vendas
    FROM itens_venda iv
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN produtos p ON p.id_produto = iv.produto_id
	JOIN marcas m ON m.id_marca = p.marca_id  
    GROUP BY Nome_Marca
    ORDER BY Qtd_Vendas DESC
    )
    
/*
2. Análise de Fornecedores:
Realize uma alteração semelhante na consulta para calcular a porcentagem de vendas atribuídas a cada fornecedor.
*/    
SELECT Nome_Fornecedor, Qtd_Vendas, ROUND(100.0*Qtd_Vendas/(SELECT COUNT(*) FROM itens_venda), 2) || '%' AS Porcentagem
FROM(
    SELECT f.nome AS Nome_Fornecedor, COUNT(iv.produto_id) AS Qtd_Vendas
    FROM itens_venda iv
	JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id  
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN produtos p ON p.id_produto = iv.produto_id
    GROUP BY Nome_Fornecedor
    ORDER BY Qtd_Vendas DESC
    )