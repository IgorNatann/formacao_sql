-- Uma análise financeira está sendo conduzida para avaliar se os salários pagos aos colaboradores estão competitivos. O departamento de Recursos Humanos solicitou um relatório que exiba a média salarial de cada departamento para decisões estratégicas de reajustes.

-- 1. Sua missão é criar uma consulta SQL que calcule e exiba a média salarial por departamento, utilizando subconsultas. O resultado deve incluir o nome do departamento e o respectivo salário médio.

SELECT 
    TD.NomeDepartamento,
    (SELECT CAST(AVG(TC.Salario) AS DECIMAL (10,2))
    FROM TabelaColaboradores TC
    WHERE TC.id_departamento = TD.id_departamento) AS SalarioMedio
FROM TabelaDepartamento TD
ORDER BY SalarioMedio DESC;


-- O banco está conduzindo uma auditoria para identificar empréstimos com valores fora do padrão. Uma das metas é listar todos os empréstimos que possuem valores acima da média geral. Esses dados são fundamentais para reavaliar as políticas de crédito.

-- 2. Diante deste cenário, escreva uma consulta SQL que exiba os nomes dos clientes e os valores de seus empréstimos, mas apenas aqueles cujo valor seja superior à média geral de empréstimos.

SELECT 
    TC.id_cliente,
    TC.Nome,
    TE.Valor
FROM TabelaClientes TC
JOIN TabelaEmprestimo TE ON TC.id_cliente = TE.id_cliente
WHERE TE.Valor > (SELECT AVG(Valor) FROM TabelaEmprestimo TE);

-- Para expandir os serviços bancários e planejar novas agências, o banco precisa de um relatório que exiba o número total de empréstimos ativos em cada cidade. Esses dados ajudarão a identificar regiões prioritárias.

-- 3. Como você criaria uma consulta SQL que calcule e exiba o total de empréstimos ativos por cidade?

SELECT
    TC.Cidade,
    COUNT(*) AS TotalEmprestimosAtivos
from TabelaEmprestimo TE
INNER JOIN TabelaClientes TC ON TE.id_cliente = TC.id_cliente
WHERE TE.Status = '1'
GROUP BY TC.Cidade;

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
WHERE Status = '1'







