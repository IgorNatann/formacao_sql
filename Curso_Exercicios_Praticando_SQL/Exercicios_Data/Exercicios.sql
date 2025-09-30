USE Exercicios_Data;

-- 1. Você está analisando os registros da tabela TabelaPagamentos e quer saber a data e hora atual para registrar no log do sistema. Crie uma consulta SQL para exibir a data e hora atual.

SELECT
    GETDATE() AS DataHoraAtual;

-- 2. Você precisa exibir a data de nascimento dos clientes da tabela TabelaClientes no formato YYYY-MM-DD. Use a função de formatação para ajustar o formato de exibição.

SELECT
    Nome,
    FORMAT(DataNascimento, 'yyyy-MM-dd') AS DataNascimentoFormatada
FROM
    TabelaClientes;

-- 3. A equipe financeira precisa treinar a geração de relatórios que envolvem operações com datas no banco de dados. Na tabela TabelaEmprestimo, temos a coluna DataInicio (data de início do empréstimo) e a coluna Prazo (quantidade de dias do empréstimo).

-- Sua tarefa é criar uma consulta SQL que, usando funções de data, calcule quantos dias existem entre a DataInicio e a data correspondente ao término do empréstimo (ou seja, DataInicio + Prazo).

-- O objetivo desse exercício é que você pratique a manipulação de datas no SQL. Embora a coluna Prazo já contenha o número de dias, ela deve ser utilizada como gabarito para que você valide se sua consulta está correta. O foco aqui não é obter um valor novo, mas sim desenvolver sua habilidade em trabalhar com funções de data.

SELECT
    id_emprestimo, 
    DATEDIFF(DAY, DataInicio, DATEADD(DAY, Prazo, DataInicio)) AS DiasTotais
FROM TabelaEmprestimo;

-- 4. O time de marketing precisa identificar o ano de nascimento dos clientes para uma campanha segmentada. Crie uma consulta SQL que extraia o ano da coluna DataNascimento na tabela TabelaClientes.

SELECT
    Nome,
    DATEPART(YEAR, DataNascimento) AS AnoNascimento
FROM TabelaClientes;

-- 5. Você quer listar os empréstimos registrados entre 2023-01-01 e 2023-03-31 na tabela TabelaEmprestimo. Crie uma consulta SQL para exibir esses registros.

SELECT *
FROM
    TabelaEmprestimo
WHERE
    DataInicio BETWEEN '2023-01-01' AND '2023-03-31';

-- 6. João, o gerente, quer saber qual será a data de vencimento de cada empréstimo, considerando o prazo em dias. Crie uma consulta SQL que adicione o valor do prazo à data de início na tabela TabelaEmprestimo.

SELECT
    id_emprestimo,
    Prazo,
    DataInicio,
    DATEADD(DAY, Prazo, DataInicio) AS DataVencimento
FROM
    TabelaEmprestimo;

-- 7. Você precisa exibir os pagamentos registrados na tabela TabelaPagamentos ordenados pela data de pagamento em ordem crescente.

SELECT *
FROM
    TabelaPagamentos
ORDER BY
    DataPagamento ASC;

-- 8. A equipe de suporte quer saber a idade atual dos clientes com base na coluna DataNascimento. Crie uma consulta SQL que calcule a idade dos clientes.

SELECT
    Nome,
    DATEDIFF(DAY, DataNascimento, GETDATE()) / 365 AS Idade
FROM
    TabelaClientes;

-- 9. Você precisa verificar quais empréstimos estão vencidos com base na data atual. Use as funções de data para criar uma consulta que exiba "Vencido" ou "No Prazo" para cada empréstimo na tabela TabelaEmprestimo.

SELECT
    id_emprestimo,
    CASE 
        WHEN DATEADD(DAY, Prazo, DataInicio) < GETDATE() THEN 'Vencido'
        ELSE 'No Prazo'
    END AS Status
FROM
    TabelaEmprestimo;

-- 10. A equipe de planejamento precisa calcular o próximo pagamento de cada empréstimo registrado na tabela TabelaEmprestimo. O próximo pagamento será calculado a partir da data de pagamento anterior, com base em um intervalo fixo de 30 dias. Crie uma consulta SQL que exiba o próximo pagamento para cada empréstimo.
SELECT
    id_emprestimo,
    DataInicio,
    DATEADD(DAY, 30, DataInicio) AS ProximoPagamento
FROM
    TabelaEmprestimo;