-- === 5) BLOCOS-V�LVULA PARA VOC� TESTAR (apenas marcadores, sem respostas) ===
-- 1) Selecione os primeiros 5 clientes, ordenados por nome (crescente).
--    Dica: ORDER BY primeiro_nome, ultimo_nome; e TOP (5)
SELECT TOP 5 primeiro_nome FROM Clientes ORDER BY primeiro_nome;

-- 2) Produtos sem descri��o.
--    Dica: WHERE descricao IS NULL
SELECT * 
FROM Produtos
WHERE descricao IS NULL;


-- 3) Funcion�rios com nome come�ando com 'A' e terminando com 's'.
--    Dica: LIKE 'A%s'
SELECT * 
FROM Funcionarios
WHERE nome LIKE 'A%s';


-- 4) Exiba o departamento e a m�dia salarial dos funcion�rios em cada departamento na tabela funcionarios, agrupando por departamento, apenas para os departamentos cuja m�dia salarial � superior a $5000.
--    Dica: GROUP BY departamento HAVING AVG(salario) > 5000
SELECT nome, departamento, AVG(salario) as media_salario
FROM Funcionarios 
GROUP BY nome, departamento
HAVING AVG(salario) > 5000;


-- 5) Selecione todos os clientes da tabela clientes e concatene o primeiro e o �ltimo nome, al�m de calcular o comprimento total do nome completo.
--    Dica: CONCAT(primeiro_nome, ' ', ultimo_nome) e LEN(...)
SELECT
  CONCAT('Primeiro Nome: ', primeiro_nome, ' | Segundo Nome: ', ultimo_nome) AS nome_completo_rotulado,
  CONCAT(primeiro_nome, ' ', ultimo_nome) AS nome_completo,
--  LEN(CONCAT(primeiro_nome, ' ', ultimo_nome)) AS tamanho_nome -- inclui o espa�o
	LEN(ISNULL(primeiro_nome,'')) + LEN(ISNULL(ultimo_nome,''))
FROM Clientes;


-- 6) Para cada venda na tabela vendas, exiba o ID da venda, a data da venda e a diferen�a em dias entre a data da venda e a data atual.
--    Dica: DATEDIFF(DAY, data_venda, GETDATE())
SELECT id, data_venda, DATEDIFF(DAY, data_venda, GETDATE()) as [diferen�a_dias]
FROM Vendas;


-- 7) Selecione todos os itens da tabela pedidos e arredonde o pre�o total para o n�mero inteiro mais pr�ximo.
--    Dica: ROUND(preco_total, 0)
SELECT item, ROUND(preco_total, 0) 
FROM Pedidos;

-- 8) Converta a coluna data_string da tabela eventos, que est� em formato de texto (YYYY-MM-DD), para o tipo de data e selecione todos os eventos ap�s '2023-01-01'.
--    Dica: TRY_CONVERT(date, data_string)

ALTER TABLE Eventos
ALTER COLUMN data_string DATE NOT NULL;

SELECT *
FROM Eventos
WHERE data_string > '2023-01-01'  

-- 9) Na tabela avaliacoes, classifique cada avalia��o como 'Boa', 'M�dia', ou 'Ruim' com base na pontua��o: 1-3 para 'Ruim', 4-7 para 'M�dia', e 8-10 para 'Boa'.
--    Dica: CASE WHEN ... THEN ...

SELECT id, 
CASE
WHEN pontuacao BETWEEN 1 AND 3 THEN 'Ruim'
WHEN pontuacao BETWEEN 4 AND 7 THEN 'M�dia'
ELSE 'Boa'
END AS avaliacao
FROM Avaliacoes
ORDER BY avaliacao;

-- 10) Altere o nome da coluna data_nasc para data_nascimento na tabela funcionarios e selecione todos os funcion�rios que nasceram ap�s '1990-01-01'..
--     Dica: WHERE data_nascimento > '1990-01-01'
EXEC sp_rename 'funcionarios.data_nasc', 'data_nascimento', 'COLUMN';

SELECT *
FROM Funcionarios
WHERE data_nascimento > '1990-01-01';