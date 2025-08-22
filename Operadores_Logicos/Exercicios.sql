/*
1. O setor de Recursos Humanos deseja mapear os colaboradores que possuem salários acima da média para avaliar políticas de remuneração e retenção. O foco inicial será no departamento de Tecnologia da Informação (TI), cujo identificador é D03, onde os salários tendem a ser mais elevados.
Liste os colaboradores do departamento de TI que possuem um salário superior a R$ 4.500.
*/

SELECT NomeColaborador, Salario, id_departamento
FROM TabelaColaboradores
WHERE id_departamento = 'D03' AND Salario > '4.500';

/*
2. O gerente de contas deseja oferecer benefícios exclusivos para clientes que se encaixam em critérios específicos: ter nascido antes de 1990 ou residir no estado de São Paulo (SP).
Esses clientes serão alvo de uma campanha especial de fidelização. Liste os clientes que nasceram antes de 1990 ou que residem no estado de São Paulo.
*/

SELECT Nome, DataNascimento, Estado
FROM TabelaClientes
WHERE DataNascimento < '1990-01-01' OR Estado = 'SP';

/*
3. A equipe financeira precisa revisar todos os empréstimos concedidos ao longo do ano de 2023 para garantir conformidade regulatória e analisar padrões de concessão.
Liste todos os empréstimos concedidos entre 01/01/2023 e 31/12/2023.
*/

SELECT id_emprestimo, DataInicio, Tipo, Valor
FROM TabelaEmprestimo
WHERE DataInicio BETWEEN '01/01/2023' AND '31/12/2023';

/*
4. A equipe de marketing deseja criar campanhas voltadas exclusivamente para clientes maiores de idade, garantindo que todas as ofertas estejam em conformidade com as regulamentações.
Liste os clientes que possuem 18 anos ou mais.
*/

SELECT Nome, DataNascimento, CPF
FROM TabelaClientes
WHERE NOT (DATEDIFF(YEAR, DataNascimento, GETDATE()) < 18);

/*
5. O gerente de produtos precisa analisar o volume de empréstimos concedidos especificamente para as categorias "Pessoal" e "Imobiliário", pois essas modalidades são estratégicas para a instituição.
Liste os empréstimos que pertencem às categorias "Pessoal" ou "Imobiliário".
*/

SELECT id_emprestimo, Tipo, Valor
FROM TabelaEmprestimo
WHERE Tipo IN ('Pessoal', 'Imobiliário');

/*
6. A equipe de crédito precisa identificar empréstimos concedidos entre R$ 10.000 e R$ 50.000 nas categorias "Consignado" e "Automóvel" para avaliar a performance dessas linhas de crédito.
Liste os empréstimos que possuem valores entre R$ 10.000 e R$ 50.000 e pertencem às categorias "Consignado" ou "Automóvel".
*/

SELECT id_emprestimo, Tipo, Valor
FROM TabelaEmprestimo
WHERE Valor BETWEEN 10000 AND 50000 AND Tipo IN ('Consignado', 'Automóvel');

/*
7. A equipe de atendimento deseja entender melhor a distribuição geográfica dos clientes, identificando quais estados possuem clientes cadastrados.
Liste os estados distintos onde os clientes residem.
*/

SELECT DISTINCT Estado
FROM TabelaClientes
ORDER BY Estado;

/*
8. A equipe de suporte deseja filtrar clientes que residem no Rio de Janeiro ou em Salvador e cujo CPF começa com "6", pois esses clientes poderão receber benefícios personalizados.
Liste os clientes que moram no Rio de Janeiro ou Salvador e cujo CPF inicie com "6".
*/

SELECT Nome, CPF, Cidade, Estado 
FROM TabelaClientes
WHERE (Cidade = 'Rio de Janeiro' OR Cidade = 'Salvador') AND CPF LIKE '6%';

/*
9. A equipe de crédito deseja analisar pagamentos de empréstimos que ocorreram ao longo de 2023 e tiveram valores entre R$ 500 e R$ 1.000. Essas informações serão utilizadas para entender a capacidade de pagamento dos clientes e possíveis ajustes em políticas de crédito.
Liste os pagamentos realizados no ano de 2023 com valores entre R$ 500 e R$ 1.000.
*/

SELECT id_pagamento, DataPagamento, Valor, Status
FROM TabelaPagamentos
WHERE DataPagamento BETWEEN '01/01/2023' AND '31/12/2023' AND Valor BETWEEN 500 AND 1000;

/*
10. A equipe de análise de risco deseja identificar clientes que possuem uma pontuação de crédito abaixo de 700. Esses clientes podem precisar de acompanhamento adicional para evitar inadimplência e receber orientações sobre planejamento financeiro.
Liste os clientes que possuem uma pontuação de crédito menor ou igual a 700.
*/

SELECT id_cliente, Pontuacao, Fonte
FROM TabelaScoreCredito
WHERE Pontuacao < 700;