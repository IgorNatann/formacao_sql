-- 🔹 Funções de Agregação
-- SOMA dos valores
SELECT SUM(Salario) AS TotalSalarios
FROM Funcionarios;

-- MÉDIA dos valores
SELECT AVG(Salario) AS MediaSalarial
FROM Funcionarios;

-- CONTAGEM de registros (tudo)
SELECT COUNT(*) AS TotalFuncionarios
FROM Funcionarios;

-- CONTAGEM de valores não nulos em uma coluna
SELECT COUNT(Salario) AS FuncionariosComSalario
FROM Funcionarios;

-- MAIOR valor
SELECT MAX(Salario) AS MaiorSalario
FROM Funcionarios;

-- MENOR valor
SELECT MIN(Salario) AS MenorSalario
FROM Funcionarios;

-- 🔹 GROUP BY
-- Agrupa os dados por uma ou mais colunas para aplicar funções de agregação.
-- Total de salário por departamento
SELECT Departamento, SUM(Salario) AS TotalSalarios
FROM Funcionarios
GROUP BY Departamento;

-- Média salarial por cargo
SELECT Cargo, AVG(Salario) AS MediaSalario
FROM Funcionarios
GROUP BY Cargo;


-- 🔹 HAVING
-- Filtra os resultados após o GROUP BY (diferente do WHERE, que filtra antes).
-- Departamentos com mais de 5 funcionários
SELECT Departamento, COUNT(*) AS TotalFuncionarios
FROM Funcionarios
GROUP BY Departamento
HAVING COUNT(*) > 5;

-- Cargos com média salarial acima de 5000
SELECT Cargo, AVG(Salario) AS MediaSalario
FROM Funcionarios
GROUP BY Cargo
HAVING AVG(Salario) > 5000;


-- 📍 Resumo rápido:
-- SUM, AVG, COUNT, MAX, MIN → cálculos sobre colunas.
-- GROUP BY → agrupa linhas para calcular agregados.
-- HAVING → filtra os agregados (pense: “WHERE depois do GROUP BY”).