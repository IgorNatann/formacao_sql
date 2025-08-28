/* Exericios */

-- 1. Com base nesse requisito, escreva uma consulta SQL que exiba todos os nomes dos clientes no formato padronizado em maiúsculas.
SELECT UPPER(nome) AS nome_padronizado
FROM TabelaClientes;

-- 2. Que consulta você utilizaria para converter os nomes dos colaboradores em letras minúsculas?
SELECT LOWER(nome) AS nome_padronizado
FROM TabelaClientes;

-- 3. Como você criaria uma consulta SQL para extrair os três primeiros caracteres do nome e CPF de cada cliente para formar um identificador único?

SELECT SUBSTRING(nome, 1, 3) AS nome_inicial,
       SUBSTRING(cpf, 1, 3) AS cpf_inicial,
       CONCAT(SUBSTRING(nome, 1, 3), SUBSTRING(cpf, 1, 3)) AS identificador_unico
FROM TabelaClientes;

-- 4. Qual seria uma abordagem para criar uma consulta que retorne os nomes dos clientes e o número de caracteres de cada um?
SELECT nome, LEN(nome) AS numero_de_caracteres
FROM TabelaClientes;


/* A liderança da DataFinance solicitou um relatório detalhado dos responsáveis pelos departamentos da empresa. Atualmente, os dados estão separados, mas o setor de Recursos Humanos precisa exibir o nome completo do colaborador, seguido de seu cargo no departamento, em uma única coluna.
-- 5. Que consulta SQL poderia ser criada para apresentar essas informações de maneira clara e organizada? */
SELECT CONCAT(NomeColaborador, ' - ', Cargo) AS colaborador_e_cargo
FROM TabelaColaboradores;

/*
A tarefa de revisar os relatórios internos da DataFinance faz parte de uma atualização nos processos de gestão. Durante uma reunião, foi decidido que os nomes dos departamentos precisam ser simplificados para melhorar a clareza nos relatórios. Um exemplo dessa mudança é o setor de "Recursos Humanos", que passará a ser exibido como "RH".

-- 6. Que consulta SQL poderia ser utilizada para ajustar os nomes exibidos, substituindo "Recursos Humanos" por "RH"?
*/
SELECT REPLACE(NomeDepartamento, 'Recursos Humanos', 'RH') AS NomeDepartamentoAjustado
FROM TabelaDepartamento;

/*
Neste desafio, você irá aprimorar a apresentação dos dados de empréstimos para facilitar a leitura e a interpretação rápida das informações essenciais. Usando funções de manipulação de strings e formatação numérica no SQL, você criará uma descrição formatada para cada empréstimo listado na tabela Empréstimo.

-- 6. O objetivo é combinar as informações de tipo, status e valor do empréstimo em uma única string formatada que seja clara, informativa e estéticamente agradável.
*/
SELECT CONCAT(
    Tipo, ' - ', 
    Status, ' - R$ ', 
    FORMAT(Valor, 'N2', 'pt-BR')
) AS DescricaoEmprestimo
FROM TabelaEmprestimo;

/*
A organização dos registros de pagamentos está sendo aprimorada pela equipe financeira para tornar o sistema mais eficiente. Para melhorar a visualização e facilitar consultas, foi solicitado que cada pagamento receba um identificador único baseado no status e no ID do pagamento. Por exemplo, pagamentos com status "Pago" podem gerar identificadores como "PagP01".

-- 6. Qual consulta SQL poderia ser usada para gerar um identificador único para cada pagamento, exibindo o status e o ID do pagamento concatenados?
*/

SELECT id_pagamento,
SUBSTRING(Status, 1, 3) + id_pagamento AS IdentificadorPagamento
FROM TabelaPagamentos;

/*
O setor de análise de crédito precisa padronizar os relatórios utilizados em apresentações para investidores. Um problema identificado foi a inconsistência nas fontes de consulta do score de crédito, onde algumas aparecem com nomes longos, como "Boa Vista", enquanto outras são abreviadas, como "SPC".

Para garantir que todos os dados estejam uniformes, é necessário padronizar as fontes. O nome "Serasa" deve ser convertido para "SER", "SPC" permanece como está, e "Boa Vista" deve ser abreviado para "BOA".

-- 6. Como você criaria uma consulta para gerar as abreviações padronizadas das fontes de consulta do score de crédito?
*/
SELECT 
    id_score,
    Fonte,
    UPPER(REPLACE(REPLACE(Fonte, 'Boa Vista', 'BOA'), 'Serasa', 'SER')) AS FonteAbreviada
FROM TabelaScoreCredito;

SELECT id_score, Fonte,
    CASE 
        WHEN Fonte = 'Serasa' THEN 'SER'
        WHEN Fonte = 'Boa Vista' THEN 'BOA'
        ELSE Fonte
    END AS FontePadronizada
FROM TabelaScoreCredito;

/*
Durante uma auditoria, o setor financeiro identificou inconsistências nos registros de tipos de empréstimos. Alguns registros possuem espaços extras no início ou no final dos valores, o que está causando problemas em relatórios e sistemas integrados.

Sua missão é corrigir essas inconsistências, removendo os espaços extras nos valores da coluna Tipo.

-- 7. Qual consulta você utilizaria para exibir os tipos de empréstimos já padronizados?
*/

SELECT id_emprestimo, 
       LTRIM(RTRIM(Tipo)) AS TipoPadronizado
FROM TabelaEmprestimo;