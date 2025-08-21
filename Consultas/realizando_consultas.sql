USE Consultas;

/*
1. Você é um analista de dados trabalhando com um banco de dados de empréstimo. Nesse banco, temos diversas tabelas. Nesse momento, a ideia é conhecer os dados da TabelaClientes, e para isso você precisa visualizar todas as informações armazenadas nela. Sua tarefa é criar uma consulta SQL que selecione todas as colunas dessa tabela.
*/

SELECT * FROM TabelaClientes;

/*
2. Como analista, você quer listar apenas os nomes dos colaboradores e seus respectivos cargos. Utilize a tabela TabelaColaboradores e selecione apenas as colunas necessárias para essa consulta.
*/

SELECT NomeColaborador, Cargo FROM TabelaColaboradores;

/*
3. Você precisa identificar todos os empréstimos ativos no sistema. Considere que a tabela TabelaEmprestimo possui uma coluna Status que indica se o empréstimo está ativo (TRUE) ou não (FALSE). Crie uma consulta para listar apenas os empréstimos ativos.
*/

SELECT * FROM TabelaEmprestimo WHERE Status = 1;

/*
4. A equipe de vendas quer planejar uma campanha específica para clientes do estado de São Paulo (SP). Utilize a tabela TabelaClientes para listar os clientes que residem nesse estado.
*/

SELECT Nome, Estado FROM TabelaClientes WHERE Estado = 'SP';

/*
5. O gerente precisa saber quais colaboradores recebem um salário superior a R$5.000 para planejar um ajuste salarial. Utilize a tabela TabelaColaboradores e filtre os resultados para incluir apenas os colaboradores que atendam a esse critério.
*/

SELECT NomeColaborador, Salario FROM TabelaColaboradores WHERE Salario > 5000;

/*
6. O gerente da loja quer analisar os maiores empréstimos realizados. Considere que a tabela de produtos se chama TabelaEmprestimo e que ela possui uma coluna Valor. Crie uma consulta para listar apenas os empréstimos cujo valor seja maior ou igual a R$10.000.
*/

SELECT * FROM TabelaEmprestimo WHERE Valor >= 10000;

/*
7. Você quer visualizar os colaboradores organizados em ordem alfabética de seus nomes. Use a tabela TabelaColaboradores e ordene os resultados pela coluna NomeColaborador.
*/

SELECT NomeColaborador, Cargo FROM TabelaColaboradores ORDER BY NomeColaborador;

/*
8. A equipe precisa de uma amostra dos 5 primeiros colaboradores cadastrados no sistema. Use a tabela TabelaColaboradores e limite o número de registros retornados para 5.
*/

SELECT TOP 5 * FROM TabelaColaboradores;

/*
9. O gerente financeiro quer visualizar os empréstimos, do maior valor para o menor. Utilize a tabela TabelaEmprestimo e ordene os resultados pela coluna Valor em ordem decrescente.
*/

SELECT * FROM TabelaEmprestimo ORDER BY VALOR DESC;

/*
10. O gerente financeiro quer identificar rapidamente os dois colaboradores com os maiores salários acima de R$5.000 para revisar uma proposta de aumento.
Utilize a tabela TabelaColaboradores e crie uma consulta que ordene os colaboradores por seus IDs em ordem decrescente, listando apenas os dois primeiros registros que atendam ao critério de salário.
*/

SELECT TOP 2 * FROM TabelaColaboradores WHERE Salario > 5000 ORDER BY id_colaborador DESC;