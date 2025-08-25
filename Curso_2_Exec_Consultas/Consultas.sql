USE Executando_Consultas_SQL;

-- Buscando Top 5 Salarios mais alto, onde a data de termino é diferente de null.
SELECT TOP 5 * 
FROM HistoricoEmprego
WHERE DataTermino IS NULL
ORDER BY Salario DESC;

-- Buscando todos os cursos que começa com 'O Poder'.
SELECT *
FROM Treinamento
WHERE Curso LIKE 'O poder%';

-- Buscando todos os cursos que contenha a palavra Realizar no começo meio ou fim.
SELECT *
FROM Treinamento
WHERE Curso LIKE '%realizar%'
ORDER BY DataConclusao DESC;

-- Buscando todos os colaboradores que Começa com o nome Isadora.
SELECT * FROM Colaboradores
WHERE Nome LIKE 'Isadora%';

-- Buscando Funcionarios especificos com filtro.
SELECT *
FROM HistoricoEmprego
WHERE Cargo = 'Professor' AND DataTermino IS NOT NULL;

SELECT *
FROM Colaboradores 
WHERE ID = 56

-- Buscando Cargos mesclados através do OR.
SELECT *
FROM HistoricoEmprego
WHERE Cargo = 'Oftalmologista' OR Cargo = 'Dermatologista';

-- Buscando Cargos mesclados através do IN.
SELECT *
FROM HistoricoEmprego
WHERE Cargo IN ('Oftalmologista', 'Dermatologista', 'Professor');

-- Buscando Cargos mesclados através do NOT IN.
SELECT *
FROM HistoricoEmprego
WHERE Cargo NOT IN ('Oftalmologista', 'Dermatologista', 'Professor');

-- Buscando Registros Utilizando duas expressões.
SELECT *
FROM Treinamento
WHERE (Curso LIKE 'O direito%' AND Instituicao = 'da Rocha') OR
(Curso LIKE 'O conforto%' AND Instituicao = 'das Neves');

/* Funções de agregação */

-- Consultando o mês com maior faturamento.
SELECT TOP (1) mes, faturamento_bruto
FROM faturamento
ORDER BY faturamento_bruto DESC;

-- Consultando o mês com o menor faturamento.
SELECT TOP (1) mes, faturamento_bruto
FROM faturamento
ORDER BY faturamento_bruto;

-- Consultando total de novos clientes.
SELECT SUM(numero_novos_clientes) AS [Novos Clientes 2023]
FROM faturamento
WHERE mes LIKE '%2023'; 

-- AVG para calcular média.
SELECT AVG(despesas) AS [MÉDIA DESPESAS 2023], AVG(lucro_liquido) AS [MÉDIA LUCRO.L 2023]
FROM faturamento;
--WHERE mes LIKE '%2023'; 

-- Count para contar linha que atendem ao filtro.
SELECT COUNT(*)
FROM HistoricoEmprego
WHERE DataTermino IS NOT NULL;

-- Count para retornar todos que estão em Férias.
SELECT COUNT(*)
FROM Licencas
WHERE TipoLicenca = 'Férias';

-- Utilizando Group By para identificar e contar os tipos de parantesco.
SELECT Parentesco, COUNT(*) AS Total
FROM Dependentes
GROUP BY Parentesco;

-- Consulta com COUNT para Contar o Total de curso por instituição, Utilizando HAVING para filtrar após agregação.
SELECT Instituicao, COUNT(Curso) AS [Total Curso]
FROM Treinamento
GROUP BY Instituicao
HAVING COUNT(Curso) > 2;

-- Consulta com Agregação e Group By, aplicando filtros atraves do Having.
SELECT Cargo, COUNT(Cargo) AS Quantidade
FROM HistoricoEmprego
GROUP BY Cargo
HAVING COUNT(Cargo) >= 2
ORDER BY Quantidade DESC;

-- Utilizando LEN para verificar o tamanho de caracteres contido no atributo.
SELECT Nome, LEN(CPF) AS QTD
FROM Colaboradores
WHERE LEN(CPF) = 11;

-- Concatenação de Colunas e Strings
SELECT ('A pessoa colaboradora: ' + Nome + ' com o CPF: ' + CPF + ' possui o seguinte endereço: ' + Endereco) AS Texto
FROM Colaboradores;

SELECT UPPER('A pessoa colaboradora: ' + Nome + ' com o CPF: ' + CPF + ' possui o seguinte endereço: ' + Endereco) AS Texto
FROM Colaboradores;

SELECT LOWER('A pessoa colaboradora: ' + Nome + ' com o CPF: ' + CPF + ' possui o seguinte endereço: ' + Endereco) AS Texto
FROM Colaboradores;

