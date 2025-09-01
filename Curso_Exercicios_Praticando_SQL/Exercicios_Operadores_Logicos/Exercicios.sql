USE Operadores_Logicos;

/*
1. O setor de Recursos Humanos deseja mapear os colaboradores que possuem sal�rios acima da m�dia para avaliar pol�ticas de remunera��o e reten��o. O foco inicial ser� no departamento de Tecnologia da Informa��o (TI), cujo identificador � D03, onde os sal�rios tendem a ser mais elevados.
Liste os colaboradores do departamento de TI que possuem um sal�rio superior a R$ 4.500.
*/

SELECT NomeColaborador, Salario, id_departamento
FROM TabelaColaboradores
WHERE id_departamento = 'D03' AND Salario > '4.500';

/*
2. O gerente de contas deseja oferecer benef�cios exclusivos para clientes que se encaixam em crit�rios espec�ficos: ter nascido antes de 1990 ou residir no estado de S�o Paulo (SP).
Esses clientes ser�o alvo de uma campanha especial de fideliza��o. Liste os clientes que nasceram antes de 1990 ou que residem no estado de S�o Paulo.
*/

SELECT Nome, DataNascimento, Estado
FROM TabelaClientes
WHERE DataNascimento < '1990-01-01' OR Estado = 'SP';

/*
3. A equipe financeira precisa revisar todos os empr�stimos concedidos ao longo do ano de 2023 para garantir conformidade regulat�ria e analisar padr�es de concess�o.
Liste todos os empr�stimos concedidos entre 01/01/2023 e 31/12/2023.
*/

SELECT id_emprestimo, DataInicio, Tipo, Valor
FROM TabelaEmprestimo
WHERE DataInicio BETWEEN '01/01/2023' AND '31/12/2023';

/*
4. A equipe de marketing deseja criar campanhas voltadas exclusivamente para clientes maiores de idade, garantindo que todas as ofertas estejam em conformidade com as regulamenta��es.
Liste os clientes que possuem 18 anos ou mais.
*/

SELECT Nome, DataNascimento, CPF
FROM TabelaClientes
WHERE NOT (DATEDIFF(YEAR, DataNascimento, GETDATE()) < 18);

/*
5. O gerente de produtos precisa analisar o volume de empr�stimos concedidos especificamente para as categorias "Pessoal" e "Imobili�rio", pois essas modalidades s�o estrat�gicas para a institui��o.
Liste os empr�stimos que pertencem �s categorias "Pessoal" ou "Imobili�rio".
*/

SELECT id_emprestimo, Tipo, Valor
FROM TabelaEmprestimo
WHERE Tipo IN ('Pessoal', 'Imobili�rio');

/*
6. A equipe de cr�dito precisa identificar empr�stimos concedidos entre R$ 10.000 e R$ 50.000 nas categorias "Consignado" e "Autom�vel" para avaliar a performance dessas linhas de cr�dito.
Liste os empr�stimos que possuem valores entre R$ 10.000 e R$ 50.000 e pertencem �s categorias "Consignado" ou "Autom�vel".
*/

SELECT id_emprestimo, Tipo, Valor
FROM TabelaEmprestimo
WHERE Valor BETWEEN 10000 AND 50000 AND Tipo IN ('Consignado', 'Autom�vel');

/*
7. A equipe de atendimento deseja entender melhor a distribui��o geogr�fica dos clientes, identificando quais estados possuem clientes cadastrados.
Liste os estados distintos onde os clientes residem.
*/

SELECT DISTINCT Estado
FROM TabelaClientes
ORDER BY Estado;

/*
8. A equipe de suporte deseja filtrar clientes que residem no Rio de Janeiro ou em Salvador e cujo CPF come�a com "6", pois esses clientes poder�o receber benef�cios personalizados.
Liste os clientes que moram no Rio de Janeiro ou Salvador e cujo CPF inicie com "6".
*/

SELECT Nome, CPF, Cidade, Estado 
FROM TabelaClientes
WHERE (Cidade = 'Rio de Janeiro' OR Cidade = 'Salvador') AND CPF LIKE '6%';

/*
9. A equipe de cr�dito deseja analisar pagamentos de empr�stimos que ocorreram ao longo de 2023 e tiveram valores entre R$ 500 e R$ 1.000. Essas informa��es ser�o utilizadas para entender a capacidade de pagamento dos clientes e poss�veis ajustes em pol�ticas de cr�dito.
Liste os pagamentos realizados no ano de 2023 com valores entre R$ 500 e R$ 1.000.
*/

SELECT id_pagamento, DataPagamento, Valor, Status
FROM TabelaPagamentos
WHERE DataPagamento BETWEEN '01/01/2023' AND '31/12/2023' AND Valor BETWEEN 500 AND 1000;

/*
10. A equipe de an�lise de risco deseja identificar clientes que possuem uma pontua��o de cr�dito abaixo de 700. Esses clientes podem precisar de acompanhamento adicional para evitar inadimpl�ncia e receber orienta��es sobre planejamento financeiro.
Liste os clientes que possuem uma pontua��o de cr�dito menor ou igual a 700.
*/

SELECT id_cliente, Pontuacao, Fonte
FROM TabelaScoreCredito
WHERE Pontuacao < 700;