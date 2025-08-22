CREATE DATABASE FORMACAO_SQL;

USE FORMACAO_SQL;
/*
1) Crie uma tabela chamada funcionarios com as seguintes colunas: id (int, chave primária), nome (varchar(100)), departamento (varchar(100)) e salario (float). Em seguida, insira os seguintes registros de funcionários na tabela:

ID: 1, Nome: Heitor Vieira, Departamento: Financeiro, Salário: 4959.22
ID: 2, Nome: Daniel Campos, Departamento: Vendas, Salário: 3884.44
ID: 3, Nome: Luiza Dias, Departamento: TI, Salário: 8205.78
ID: 4, Nome: Davi Lucas Moraes, Departamento: Financeiro, Salário: 8437.02
ID: 5, Nome: Pietro Cavalcanti, Departamento: TI, Salário: 4946.88
ID: 6, Nome: Evelyn da Mata, Departamento: Vendas, Salário: 5278.88
ID: 7, Nome: Isabella Rocha, Departamento: Marketing, Salário: 4006.03
ID: 8, Nome: Sra. Manuela Azevedo, Departamento: Vendas, Salário: 6101.88
ID: 9, Nome: Brenda Cardoso, Departamento: TI, Salário: 8853.34
ID: 10, Nome: Danilo Souza, Departamento: TI, Salário: 8242.14
*/

CREATE TABLE funcionarios (
	ID INT PRIMARY KEY,
	Nome VARCHAR (100),
	Departamento VARCHAR (100),
	Salario FLOAT
);

INSERT INTO funcionarios (
	ID,
	Nome,
	Departamento,
	Salario
) VALUES 
	(1, 'Heitor Vieira', 'Financeiro', 4959.22),
	(2, 'Daniel Campos', 'Vendas', 3884.44),
	(3, 'Luiza Dias', 'TI', 8205.78),
	(4, 'Davi Lucas Moraes', 'Financeiro', 8437.02),
	(5, 'Pietro Cavalcanti', 'TI', 4946.88),
	(6, 'Evelyn da Mata', 'Vendas', 5278.88),
	(7, 'Isabella Rocha', 'Marketing', 4006.03),
	(8, 'Sra. Manuela Azevedo', 'Vendas', 6101.88),
	(9, 'Brenda Cardoso', 'TI', 8853.34),
	(10, 'Danilo Souza', 'TI', 8242.14)

/*
2) Selecione todos os campos de todos os registros na tabela funcionarios.
*/

SELECT * FROM funcionarios;

/*
3) Na tabela funcionarios, selecione os nomes dos funcionários que trabalham no departamento de "Vendas".
*/

SELECT Nome FROM funcionarios WHERE Departamento = 'Vendas';

/*
4) Selecione os funcionários da tabela funcionarios cujo salário seja maior que 5000.
*/

SELECT * FROM funcionarios WHERE Salario > 5000 ORDER BY Salario DESC;

/* 
5) Na tabela funcionarios, selecione todos os departamentos distintos.
*/

SELECT DISTINCT Departamento FROM funcionarios;

/*
6) Atualize o salário dos funcionários do departamento de "TI" para 7500 na tabela funcionarios.
*/

UPDATE funcionarios SET Salario = 7500 WHERE Departamento = 'TI';
SELECT * FROM funcionarios;

/*
7) Delete da tabela funcionarios todos os registros de funcionários que ganham menos de 4000.
*/

DELETE FROM funcionarios WHERE Salario < 4000;

/*
8) Selecione os nomes e salários dos funcionários que trabalham no departamento de "Vendas" e cujo salário seja maior ou igual a 6000.
*/

SELECT Nome, Salario FROM funcionarios WHERE Departamento = 'Vendas' AND Salario >= 6000;

/*
9) Crie uma tabela chamada projetos com as colunas: id_projeto (int, chave primária), nome_projeto (varchar(100)), id_gerente (int, referência a id na tabela funcionarios). Insira 3 registros na tabela projetos e, em seguida, selecione todos os projetos cujo id_gerente seja igual a 2.
*/

CREATE TABLE projetos (
	ID_Projeto INT PRIMARY KEY,
	Nome_Projeto VARCHAR (100),
	ID_Gerente INT,
	FOREIGN KEY (ID_Gerente) REFERENCES funcionarios(ID)
);

INSERT INTO projetos (
	ID_Projeto,
	Nome_Projeto,
	ID_Gerente
) VALUES
	(1, 'Dashboard Vendas', 1),
	(2, 'Dashboard Financeiro', 5),
	(3, 'Dashboard Marketing', 5),
	(4, 'Dashboard Vendas', 3),
	(5, 'Projeto Analystc', 4),
	(6, 'Dashboard Financeiro', 3),
	(7, 'Projeto Data Science', 9)

SELECT * FROM projetos WHERE ID_Gerente = 5;

/*
10) Remova a tabela funcionarios do banco de dados.
*/

DROP TABLE funcionarios;