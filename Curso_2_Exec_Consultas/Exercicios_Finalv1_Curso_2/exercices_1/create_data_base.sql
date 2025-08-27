/* === 1) CRIAR O BANCO E USAR === */
IF DB_ID('Exercicios_Finalv1_Curso_2') IS NOT NULL
    DROP DATABASE Exercicios_Finalv1_Curso_2;
GO
CREATE DATABASE Exercicios_Finalv1_Curso_2;
GO
USE Exercicios_Finalv1_Curso_2;
GO

/* === 2) TABELAS === */

/* Clientes: primeiro/�ltimo nome para concatena��o e ordena��o */
CREATE TABLE Clientes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    primeiro_nome NVARCHAR(50) NOT NULL,
    ultimo_nome   NVARCHAR(50) NOT NULL
);

/* Produtos: descri��o pode ser NULL */
CREATE TABLE Produtos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome      NVARCHAR(100) NOT NULL,
    descricao NVARCHAR(255) NULL
);

/* Funcion�rios: departamento, sal�rio, e data_nasc */
CREATE TABLE Funcionarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome         NVARCHAR(100) NOT NULL,
    departamento NVARCHAR(50)  NOT NULL,
    salario      DECIMAL(12,2) NOT NULL,
    data_nasc    DATE          NOT NULL
);

/* Vendas: s� para calcular diferen�a em dias at� hoje */
CREATE TABLE Vendas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    data_venda DATE NOT NULL
);

/* Pedidos: pre�o_total para arredondar */
CREATE TABLE Pedidos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    item        NVARCHAR(100) NOT NULL,
    preco_total DECIMAL(12,2) NOT NULL
);

/* Eventos: data como string (YYYY-MM-DD) para convers�o */
CREATE TABLE Eventos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    data_string NVARCHAR(10) NOT NULL  -- formato 'YYYY-MM-DD'
);

/* Avalia��es: pontua��o 1..10 para classificar via CASE */
CREATE TABLE Avaliacoes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    pontuacao INT NOT NULL CHECK (pontuacao BETWEEN 1 AND 10)
);
