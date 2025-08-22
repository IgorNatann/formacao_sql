CREATE DATABASE Executando_Consultas_SQL;

USE Executando_Consultas_SQL;

-- Criando tabela HistoricoEmprego
IF OBJECT_ID('HistoricoEmprego', 'U') IS NOT NULL DROP TABLE [HistoricoEmprego];
CREATE TABLE [HistoricoEmprego] (
    [ID] NVARCHAR(MAX), [ID_Colaborador] NVARCHAR(MAX), [Cargo] NVARCHAR(MAX), [DataContratacao] NVARCHAR(MAX), [DataTermino] NVARCHAR(MAX), [Salario] DECIMAL(18,2), [Supervisor] NVARCHAR(MAX)
);

-- Criando tabela Treinamento
IF OBJECT_ID('Treinamento', 'U') IS NOT NULL DROP TABLE [Treinamento];
CREATE TABLE [Treinamento] (
    [ID] NVARCHAR(MAX), [ID_Colaborador] NVARCHAR(MAX), [Curso] NVARCHAR(MAX), [DataConclusao] NVARCHAR(MAX), [Instituicao] NVARCHAR(MAX)
);

-- Criando tabela Licencas
IF OBJECT_ID('Licencas', 'U') IS NOT NULL DROP TABLE [Licencas];
CREATE TABLE [Licencas] (
    [ID] NVARCHAR(MAX), [ID_Colaborador] NVARCHAR(MAX), [TipoLicenca] NVARCHAR(MAX), [DataInicio] NVARCHAR(MAX), [DataFim] NVARCHAR(MAX)
);

-- Criando tabela Dependentes
IF OBJECT_ID('Dependentes', 'U') IS NOT NULL DROP TABLE [Dependentes];
CREATE TABLE [Dependentes] (
    [ID] NVARCHAR(MAX), [ID_Colaborador] NVARCHAR(MAX), [Nome] NVARCHAR(MAX), [Parentesco] NVARCHAR(MAX), [DataNascimento] NVARCHAR(MAX), [CPF] NVARCHAR(MAX), [Genero] NVARCHAR(MAX)
);

-- Criando tabela Colaboradores
IF OBJECT_ID('Colaboradores', 'U') IS NOT NULL DROP TABLE [Colaboradores];
CREATE TABLE [Colaboradores] (
    [ID] NVARCHAR(MAX), [Nome] NVARCHAR(MAX), [DataNascimento] NVARCHAR(MAX), [CPF] NVARCHAR(MAX), [Endereco] NVARCHAR(MAX), [Telefone] NVARCHAR(MAX), [Email] NVARCHAR(MAX)
);

-- Criando tabela faturamento
IF OBJECT_ID('faturamento', 'U') IS NOT NULL DROP TABLE [faturamento];
CREATE TABLE [faturamento] (
    [id] NVARCHAR(MAX), [mes] NVARCHAR(MAX), [faturamento_bruto] DECIMAL(18,2), [despesas] DECIMAL(18,2), [lucro_liquido] DECIMAL(18,2), [numero_clientes] INT, [numero_novos_clientes] INT
);
