USE Exercicios_Joins;

-- 1. Você tem a missão importante de garantir que todos os nossos colaboradores estejam corretamente associados aos departamentos da empresa. Sua tarefa é criar uma consulta SQL que revele onde cada um de nossos colegas de equipe trabalha, mostrando o nome do colaborador ao lado do departamento ao qual está vinculado.

SELECT
    TC.NomeColaborador AS 'Nome',
    TD.NomeDepartamento AS 'Departamento'
FROM
    TabelaColaboradores TC
INNER JOIN TabelaDepartamento TD ON TC.id_departamento = TD.id_departamento 
ORDER BY
    'Departamento';

-- 2. A empresa precisa de um relatório detalhado sobre os dados de contato dos clientes para melhorar as estratégias de comunicação. A informação do telefone é essencial para a equipe de marketing, e sua tarefa é assegurar que possamos definir quem precisa de atualizações nos registros de contato.

SELECT
    TC.Nome AS [Nome Cliente],
    TT.Telefone AS [Telefone]
FROM
    TabelaClientes TC
LEFT JOIN TabelaTelefones TT ON TC.id_cliente = TT.id_cliente
ORDER BY
    TC.Nome;

-- 3. Para melhorar o acompanhamento e a gestão dos relacionamentos com clientes, a empresa deseja um relatório que detalhe quais colaboradores estão responsáveis por cada cliente. Importante também é identificar colaboradores que ainda não possuem clientes atribuídos, para possível redistribuição de tarefas ou para fins de treinamento.


SELECT
    C.NomeColaborador AS [Colaborador],
    CL.Nome AS [Cliente]
FROM
    TabelaColaboradores C
LEFT JOIN TabelaClientes CL ON C.id_colaborador = CL.id_colaborador
ORDER BY
    Colaborador;


-- 4. A empresa precisa de um relatório detalhado apresentando quais clientes possuem empréstimos, destacando quais empréstimos ainda não foram associados a nenhum cliente e os clientes que não possuem empréstimos. Este relatório ajudará a equipe financeira a avaliar a eficácia das políticas de crédito e identificar oportunidades de negócios adicionais.

SELECT
    TC.Nome AS [Nome Cliente],
    TE.Tipo AS [ID EMPRESTIMO],
    TE.Valor AS [Valor Emprestimo]
FROM
    TabelaClientes TC
FULL JOIN TabelaEmprestimo TE ON TC.id_cliente = TE.id_cliente
ORDER BY
    [Valor Emprestimo];

-- 5. Para otimizar o acompanhamento financeiro e melhorar a gestão de riscos, a empresa deseja um relatório que vincule os clientes não apenas aos seus empréstimos, mas também aos pagamentos realizados para esses empréstimos. Este relatório ajudará a equipe financeira a entender melhor a saúde financeira dos clientes e a eficácia das cobranças.

SELECT
    TC.Nome AS [Nome Cliente],
    TE.Tipo AS [Tipo Emprestimo],
    TE.Valor AS [Valor Emprestimo],
    TP.DataPagamento AS [Data Pagamento],
    TP.Valor AS [Valor Pago]
FROM
    TabelaClientes TC
INNER JOIN TabelaEmprestimo TE ON TC.id_cliente = TE.id_cliente
INNER JOIN TabelaPagamentos TP ON TE.id_emprestimo = TP.id_emprestimo
ORDER BY
    [Valor Pago];

-- 6. A empresa quer focar em clientes de alto valor para otimizar suas estratégias de relacionamento e oferecer produtos e serviços adicionais ajustados às necessidades desses clientes. Para isso, é crucial identificar quais clientes têm acumulado grandes somas, ultrapassando $10,000, em empréstimos.

SELECT
    TC.Nome AS [Cliente],
    CAST(TE.Valor AS DECIMAL (10, 2)) AS [Total Emprestimo]
FROM
    TabelaClientes TC
INNER JOIN TabelaEmprestimo TE ON TC.id_cliente = TE.id_cliente
WHERE
    TE.Valor > 10000
ORDER BY
    [Total Emprestimo];

-- 7. A empresa deseja visualizar todos os empréstimos realizados, seus valores e status (Ativo/Inativo), independentemente do cliente.

SELECT
    TE.Tipo AS [Tipo Emprestimo],
    TE.Valor AS [Valor],
    CASE
        WHEN TE.Status = 1 THEN 'Ativo'
        ELSE 'Inativo'
    END AS [Status]
FROM
    TabelaEmprestimo TE
ORDER BY
    [Tipo Emprestimo];

-- 8. A empresa está empenhada em otimizar a eficiência operacional e melhorar a satisfação do cliente através de uma distribuição equilibrada de trabalho entre seus colaboradores. A consulta deve listar os clientes de São Paulo e os colaboradores responsáveis por eles, incluindo os departamentos aos quais esses colaboradores pertencem.

SELECT
    TCL.Nome AS [Nome Cliente],
    TCL.Cidade AS [Cidade],
    TC.NomeColaborador AS [Colaborador],
    TD.NomeDepartamento AS [Departamento]
FROM
    TabelaClientes TCL
INNER JOIN TabelaColaboradores TC ON TCL.id_colaborador = TC.id_colaborador
INNER JOIN TabelaDepartamento TD ON TC.id_departamento = TD.id_departamento
WHERE
    TCL.Cidade = 'São Paulo'
ORDER BY
    TCL.Nome;

-- 9. A empresa deseja entender melhor o comportamento dos empréstimos de seus clientes em relação à média geral de valores de empréstimo. O objetivo é identificar clientes cujos valores de empréstimo se destacam, seja por estarem significativamente acima ou abaixo da média geral, para possíveis revisões de políticas de crédito ou ações de marketing específicas.

SELECT
    TC.Nome AS [Nome Cliente],
    TE.Valor AS [Total Emprestimo]
FROM 
    TabelaClientes TC
INNER JOIN TabelaEmprestimo TE ON TC.id_cliente = TE.id_cliente
WHERE
    TE.Valor > (SELECT AVG(Valor) FROM TabelaEmprestimo);

-- 10. A gerência deseja uma lista detalhada que mostre o nome de cada colaborador, seu email e o nome do departamento ao qual pertence.

SELECT
    TC.NomeColaborador AS [Nome Colaborador],
    TD.NomeDepartamento AS [Nome Departamento],
    TC.EmailColaborador AS [Email]
FROM
    TabelaColaboradores TC
INNER JOIN TabelaDepartamento TD ON TC.id_departamento = TD.id_departamento;