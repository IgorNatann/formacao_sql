-- === 5) BLOCOS-VÁLVULA PARA VOCÊ TESTAR (apenas marcadores, sem respostas) ===
-- 1) Selecione os primeiros 5 clientes, ordenados por nome (crescente).
--    Dica: ORDER BY primeiro_nome, ultimo_nome; e TOP (5)
SELECT TOP 5 primeiro_nome FROM Clientes ORDER BY primeiro_nome;

-- 2) Produtos sem descrição.
--    Dica: WHERE descricao IS NULL
SELECT * 
FROM Produtos
WHERE descricao IS NULL;


-- 3) Funcionários com nome começando com 'A' e terminando com 's'.
--    Dica: LIKE 'A%s'
SELECT * 
FROM Funcionarios
WHERE nome LIKE 'A%s';


-- 4) Exiba o departamento e a média salarial dos funcionários em cada departamento na tabela funcionarios, agrupando por departamento, apenas para os departamentos cuja média salarial é superior a $5000.
--    Dica: GROUP BY departamento HAVING AVG(salario) > 5000
SELECT nome, departamento, AVG(salario) as media_salario
FROM Funcionarios 
GROUP BY nome, departamento
HAVING AVG(salario) > 5000;


-- 5) Selecione todos os clientes da tabela clientes e concatene o primeiro e o último nome, além de calcular o comprimento total do nome completo.
--    Dica: CONCAT(primeiro_nome, ' ', ultimo_nome) e LEN(...)
SELECT
  CONCAT('Primeiro Nome: ', primeiro_nome, ' | Segundo Nome: ', ultimo_nome) AS nome_completo_rotulado,
  CONCAT(primeiro_nome, ' ', ultimo_nome) AS nome_completo,
--  LEN(CONCAT(primeiro_nome, ' ', ultimo_nome)) AS tamanho_nome -- inclui o espaço
	LEN(ISNULL(primeiro_nome,'')) + LEN(ISNULL(ultimo_nome,''))
FROM Clientes;


-- 6) Para cada venda na tabela vendas, exiba o ID da venda, a data da venda e a diferença em dias entre a data da venda e a data atual.
--    Dica: DATEDIFF(DAY, data_venda, GETDATE())
SELECT id, data_venda, DATEDIFF(DAY, data_venda, GETDATE()) as [diferença_dias]
FROM Vendas;


-- 7) Selecione todos os itens da tabela pedidos e arredonde o preço total para o número inteiro mais próximo.
--    Dica: ROUND(preco_total, 0)
SELECT item, ROUND(preco_total, 0) 
FROM Pedidos;

-- 8) Converta a coluna data_string da tabela eventos, que está em formato de texto (YYYY-MM-DD), para o tipo de data e selecione todos os eventos após '2023-01-01'.
--    Dica: TRY_CONVERT(date, data_string)

ALTER TABLE Eventos
ALTER COLUMN data_string DATE NOT NULL;

SELECT *
FROM Eventos
WHERE data_string > '2023-01-01'  

-- 9) Na tabela avaliacoes, classifique cada avaliação como 'Boa', 'Média', ou 'Ruim' com base na pontuação: 1-3 para 'Ruim', 4-7 para 'Média', e 8-10 para 'Boa'.
--    Dica: CASE WHEN ... THEN ...

SELECT id, 
CASE
WHEN pontuacao BETWEEN 1 AND 3 THEN 'Ruim'
WHEN pontuacao BETWEEN 4 AND 7 THEN 'Média'
ELSE 'Boa'
END AS avaliacao
FROM Avaliacoes
ORDER BY avaliacao;

-- 10) Altere o nome da coluna data_nasc para data_nascimento na tabela funcionarios e selecione todos os funcionários que nasceram após '1990-01-01'..
--     Dica: WHERE data_nascimento > '1990-01-01'
EXEC sp_rename 'funcionarios.data_nasc', 'data_nascimento', 'COLUMN';

SELECT *
FROM Funcionarios
WHERE data_nascimento > '1990-01-01';