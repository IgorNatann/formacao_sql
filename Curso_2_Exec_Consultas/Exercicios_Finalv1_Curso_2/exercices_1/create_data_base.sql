/* === 1) CRIAR O BANCO E USAR === */
IF DB_ID('Exercicios_Finalv1_Curso_2') IS NOT NULL
    DROP DATABASE Exercicios_Finalv1_Curso_2;
GO
CREATE DATABASE Exercicios_Finalv1_Curso_2;
GO
USE Exercicios_Finalv1_Curso_2;
GO

/* === 2) TABELAS === */

/* Clientes: primeiro/último nome para concatenação e ordenação */
CREATE TABLE Clientes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    primeiro_nome NVARCHAR(50) NOT NULL,
    ultimo_nome   NVARCHAR(50) NOT NULL
);

/* Produtos: descrição pode ser NULL */
CREATE TABLE Produtos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome      NVARCHAR(100) NOT NULL,
    descricao NVARCHAR(255) NULL
);

/* Funcionários: departamento, salário, e data_nasc */
CREATE TABLE Funcionarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome         NVARCHAR(100) NOT NULL,
    departamento NVARCHAR(50)  NOT NULL,
    salario      DECIMAL(12,2) NOT NULL,
    data_nasc    DATE          NOT NULL
);

/* Vendas: só para calcular diferença em dias até hoje */
CREATE TABLE Vendas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    data_venda DATE NOT NULL
);

/* Pedidos: preço_total para arredondar */
CREATE TABLE Pedidos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    item        NVARCHAR(100) NOT NULL,
    preco_total DECIMAL(12,2) NOT NULL
);

/* Eventos: data como string (YYYY-MM-DD) para conversão */
CREATE TABLE Eventos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    data_string NVARCHAR(10) NOT NULL  -- formato 'YYYY-MM-DD'
);

/* Avaliações: pontuação 1..10 para classificar via CASE */
CREATE TABLE Avaliacoes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    pontuacao INT NOT NULL CHECK (pontuacao BETWEEN 1 AND 10)
);
