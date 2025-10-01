-- Uma análise financeira está sendo conduzida para avaliar se os salários pagos aos colaboradores estão competitivos. O departamento de Recursos Humanos solicitou um relatório que exiba a média salarial de cada departamento para decisões estratégicas de reajustes.

-- 1. Sua missão é criar uma consulta SQL que calcule e exiba a média salarial por departamento, utilizando subconsultas. O resultado deve incluir o nome do departamento e o respectivo salário médio.

SELECT 
    TD.NomeDepartamento,
    (SELECT CAST(AVG(TC.Salario) AS DECIMAL (10,2))
    FROM TabelaColaboradores TC
    WHERE TC.id_departamento = TD.id_departamento) AS SalarioMedio
FROM
    TabelaDepartamento TD
ORDER BY
    SalarioMedio DESC;

-- O banco está conduzindo uma auditoria para identificar empréstimos com valores fora do padrão. Uma das metas é listar todos os empréstimos que possuem valores acima da média geral. Esses dados são fundamentais para reavaliar as políticas de crédito.

-- 2. Diante deste cenário, escreva uma consulta SQL que exiba os nomes dos clientes e os valores de seus empréstimos, mas apenas aqueles cujo valor seja superior à média geral de empréstimos.

SELECT 
    TC.id_cliente,
    TC.Nome,
    TE.Valor
FROM
    TabelaClientes TC
JOIN TabelaEmprestimo TE ON TC.id_cliente = TE.id_cliente
WHERE
    TE.Valor > (SELECT AVG(Valor) FROM TabelaEmprestimo TE);

-- Para expandir os serviços bancários e planejar novas agências, o banco precisa de um relatório que exiba o número total de empréstimos ativos em cada cidade. Esses dados ajudarão a identificar regiões prioritárias.

-- 3. Como você criaria uma consulta SQL que calcule e exiba o total de empréstimos ativos por cidade?

SELECT
    TC.Cidade,
    COUNT(*) AS TotalEmprestimosAtivos
FROM
    TabelaEmprestimo TE
INNER JOIN TabelaClientes TC ON TE.id_cliente = TC.id_cliente
WHERE
    TE.Status = '1'
GROUP BY
    TC.Cidade;

-- O banco deseja recompensar clientes que quitaram todos os seus empréstimos com benefícios exclusivos, como taxas reduzidas e maiores limites de crédito. Para isso, é necessário identificar quais clientes não possuem pagamentos pendentes.

-- 4. Crie uma consulta SQL que liste os clientes com todos os empréstimos quitados, utilizando subconsulta para verificar pendências de pagamento.

SELECT
    TC.id_cliente,
    TE.id_emprestimo,
    TC.Nome,
    TC.Email,
    TE.Valor
FROM     
    TabelaClientes TC
JOIN TabelaEmprestimo TE ON TC.id_cliente = TE.id_cliente 
WHERE
    Status = '1'

-- O banco está planejando uma campanha de marketing para clientes com alto potencial financeiro. Para isso, é necessário identificar quais possuem uma pontuação de crédito acima da média, tornando-os candidatos a ofertas especiais.

-- 5. Qual consulta SQL, você utilizaria para listar os nomes e as pontuações dos clientes com score superior à média geral?

SELECT
    TC.Nome,
    TSC.Pontuacao
FROM
    TabelaClientes TC
JOIN
    TabelaScoreCredito TSC ON TC.id_cliente = TSC.id_cliente
WHERE
    TSC.Pontuacao > (SELECT AVG(Pontuacao) FROM TabelaScoreCredito)
ORDER BY
    TSC.Pontuacao DESC;

-- O setor de Recursos Humanos precisa comparar a competitividade salarial e analisar possíveis ajustes. Assim, estão revisando os salários dos colaboradores e identificando discrepâncias nos valores pagos. Como parte dessa análise, é necessário identificar qual é o maior salário registrado em cada departamento.

-- 6. Crie uma consulta para identificar o maior salário em cada departamento, exibindo o nome do departamento e o valor do maior salário.

SELECT 
    NomeDepartamento,
    tc.NomeColaborador,
    (SELECT MAX(Salario) 
     FROM TabelaColaboradores 
     WHERE TabelaColaboradores.id_departamento = TD.id_departamento) AS MaiorSalario
FROM
    TabelaDepartamento TD
JOIN TabelaColaboradores TC ON TD.id_departamento = TC.id_departamento
ORDER BY
    MaiorSalario DESC;

-- O setor financeiro busca identificar clientes que mais utilizam os serviços de crédito do banco para criar um ranking que priorize esses clientes em ofertas futuras e também monitorar sua regularidade nos pagamentos. Para isso, é necessário calcular a quantidade de empréstimos ativos de cada cliente e ordenar os resultados de forma decrescente.

-- 7. Como você criaria uma consulta SQL que liste apenas os clientes, que possuem empréstimos ativos?

SELECT 
    TC.Nome
FROM 
    TabelaClientes TC
JOIN
    TabelaEmprestimo TE ON (TC.id_cliente = TE.id_cliente)
WHERE
    TE.Status = 1;

-- O setor financeiro quer entender o comportamento dos clientes em relação aos pagamentos realizados para diferentes tipos de empréstimos. Como parte desse estudo, é necessário calcular a média dos valores pagos para cada tipo de empréstimo.

-- 8. Escreva uma consulta SQL que exiba o tipo de empréstimo e a média dos valores pagos pelos clientes, utilizando subconsultas para realizar o cálculo.

SELECT 
    Tipo, 
    (SELECT CAST(AVG(Valor) AS DECIMAL (10, 2)) 
     FROM TabelaPagamentos 
     WHERE TabelaPagamentos.id_emprestimo = TabelaEmprestimo.id_emprestimo AND Status = 'Pago') AS MediaPagamentos
FROM
    TabelaEmprestimo;

-- A diretoria precisa de um relatório consolidado que relacione os clientes às suas contas bancárias e respectivos saldos. Esse relatório será utilizado para apresentar uma visão geral da base de clientes e do desempenho financeiro das contas.

-- 9. Como você criaria uma consulta que combine os dados de clientes, contas e saldos, utilizando subconsultas?

-- versão com Join:
SELECT 
    TC.Nome,
    TBC.NumeroConta,
    TBC.TipoConta,
    TBC.Saldo
FROM
    TabelaClientes TC
JOIN TabelaClienteConta TCC ON TC.id_cliente = TCC.id_cliente
JOIN TabelaConta TBC ON TCC.id_conta = TBC.id_conta
ORDER BY
    TBC.Saldo DESC;

-- versão com sub-consulta :
SELECT
    Nome,
    (SELECT NumeroConta FROM TabelaConta WHERE TabelaConta.id_conta = TabelaClienteConta.id_conta) AS NumeroConta,
    (SELECT TipoConta FROM TabelaConta WHERE TabelaConta.id_conta = TabelaClienteConta.id_conta) AS TipoConta,(SELECT Saldo FROM TabelaConta WHERE TabelaConta.id_conta = TabelaClienteConta.id_conta) AS Saldo
FROM
    TabelaClientes JOIN TabelaClienteConta ON TabelaClientes.id_cliente = TabelaClienteConta.id_cliente;

-- O banco está analisando a distribuição de crédito entre diferentes regiões para planejar estratégias de expansão e alocar recursos. É necessário entender quais cidades concentram os maiores valores de empréstimos concedidos, permitindo priorizar essas regiões em futuras campanhas de marketing e investimentos.

-- 10. Como você criaria uma consulta SQL para calcular o valor total dos empréstimos por cidade, utilizando subconsultas?


SELECT 
    TC.Cidade,
    TE.Valor AS TotalEmprestimo
    -- (SELECT SUM(TE.Valor) FROM TabelaEmprestimo TE JOIN TabelaClientes TC ON TE.id_cliente = TC.id_cliente  GROUP BY TC.Cidade) AS ValorTotalEmprestimo
FROM
    TabelaClientes TC
JOIN TabelaEmprestimo TE ON TC.id_cliente = TE.id_cliente
GROUP BY
    TC.Cidade, TE.Valor;

SELECT 
    c.Cidade,
    (SELECT SUM(e.Valor) 
     FROM TabelaEmprestimo e 
     WHERE e.id_cliente IN (
         SELECT cl.id_cliente 
         FROM TabelaClientes cl 
         WHERE cl.Cidade = c.Cidade
     )) AS ValorTotalEmprestimos
FROM TabelaClientes c
GROUP BY c.Cidade;