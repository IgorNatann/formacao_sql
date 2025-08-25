USE Executando_Consultas_SQL;

-- Buscando Top 5 Salarios mais alto, onde a data de termino � diferente de null.
SELECT TOP 5 * 
FROM HistoricoEmprego
WHERE DataTermino IS NULL
ORDER BY Salario DESC;

-- Buscando todos os cursos que come�a com 'O Poder'.
SELECT *
FROM Treinamento
WHERE Curso LIKE 'O poder%';

-- Buscando todos os cursos que contenha a palavra Realizar no come�o meio ou fim.
SELECT *
FROM Treinamento
WHERE Curso LIKE '%realizar%'
ORDER BY DataConclusao DESC;

-- Buscando todos os colaboradores que Come�a com o nome Isadora.
SELECT * FROM Colaboradores
WHERE Nome LIKE 'Isadora%';

-- Buscando Funcionarios especificos com filtro.
SELECT *
FROM HistoricoEmprego
WHERE Cargo = 'Professor' AND DataTermino IS NOT NULL;

SELECT *
FROM Colaboradores 
WHERE ID = 56

-- Buscando Cargos mesclados atrav�s do OR.
SELECT *
FROM HistoricoEmprego
WHERE Cargo = 'Oftalmologista' OR Cargo = 'Dermatologista';

-- Buscando Cargos mesclados atrav�s do IN.
SELECT *
FROM HistoricoEmprego
WHERE Cargo IN ('Oftalmologista', 'Dermatologista', 'Professor');

-- Buscando Cargos mesclados atrav�s do NOT IN.
SELECT *
FROM HistoricoEmprego
WHERE Cargo NOT IN ('Oftalmologista', 'Dermatologista', 'Professor');

-- Buscando Registros Utilizando duas express�es.
SELECT *
FROM Treinamento
WHERE (Curso LIKE 'O direito%' AND Instituicao = 'da Rocha') OR
(Curso LIKE 'O conforto%' AND Instituicao = 'das Neves');

/* Fun��es de agrega��o */

-- Consultando o m�s com maior faturamento.
SELECT TOP (1) mes, faturamento_bruto
FROM faturamento
ORDER BY faturamento_bruto DESC;

-- Consultando o m�s com o menor faturamento.
SELECT TOP (1) mes, faturamento_bruto
FROM faturamento
ORDER BY faturamento_bruto;

-- Consultando total de novos clientes.
SELECT SUM(numero_novos_clientes) AS [Novos Clientes 2023]
FROM faturamento
WHERE mes LIKE '%2023'; 

-- AVG para calcular m�dia.
SELECT AVG(despesas) AS [M�DIA DESPESAS 2023], AVG(lucro_liquido) AS [M�DIA LUCRO.L 2023]
FROM faturamento;
--WHERE mes LIKE '%2023'; 

-- Count para contar linha que atendem ao filtro.
SELECT COUNT(*)
FROM HistoricoEmprego
WHERE DataTermino IS NOT NULL;

-- Count para retornar todos que est�o em F�rias.
SELECT COUNT(*)
FROM Licencas
WHERE TipoLicenca = 'F�rias';

-- Utilizando Group By para identificar e contar os tipos de parantesco.
SELECT Parentesco, COUNT(*) AS Total
FROM Dependentes
GROUP BY Parentesco;

-- Consulta com COUNT para Contar o Total de curso por institui��o, Utilizando HAVING para filtrar ap�s agrega��o.
SELECT Instituicao, COUNT(Curso) AS [Total Curso]
FROM Treinamento
GROUP BY Instituicao
HAVING COUNT(Curso) > 2;

-- Consulta com Agrega��o e Group By, aplicando filtros atraves do Having.
SELECT Cargo, COUNT(Cargo) AS Quantidade
FROM HistoricoEmprego
GROUP BY Cargo
HAVING COUNT(Cargo) >= 2
ORDER BY Quantidade DESC;

-- Utilizando LEN para verificar o tamanho de caracteres contido no atributo.
SELECT Nome, LEN(CPF) AS QTD
FROM Colaboradores
WHERE LEN(CPF) = 11;

-- Concatena��o de Colunas e Strings
SELECT ('A pessoa colaboradora: ' + Nome + ' com o CPF: ' + CPF + ' possui o seguinte endere�o: ' + Endereco) AS Texto
FROM Colaboradores;

SELECT UPPER('A pessoa colaboradora: ' + Nome + ' com o CPF: ' + CPF + ' possui o seguinte endere�o: ' + Endereco) AS Texto
FROM Colaboradores;

SELECT LOWER('A pessoa colaboradora: ' + Nome + ' com o CPF: ' + CPF + ' possui o seguinte endere�o: ' + Endereco) AS Texto
FROM Colaboradores;

