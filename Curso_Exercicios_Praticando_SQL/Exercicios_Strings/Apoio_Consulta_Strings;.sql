USE Exercicios_Strings;

SELECT 
    CONCAT(primeiro_nome, ' ', ultimo_nome) AS nome_completo
FROM Clientes;

SELECT primeiro_nome, LEN(primeiro_nome) AS tamanho_nome
FROM Clientes;

SELECT 
    UPPER(primeiro_nome) AS nome_maiusculo,
    LOWER(ultimo_nome) AS sobrenome_minusculo
FROM Clientes;

SELECT 
    SUBSTRING(primeiro_nome, 1, 3) AS inicio_nome,
    SUBSTRING(ultimo_nome, LEN(ultimo_nome) - 2, 3) AS fim_sobrenome
FROM Clientes;

SELECT 
    TRIM(nome) AS nome_sem_espacos,
    TRIM(descricao) AS sobrenome_sem_espacos
FROM Produtos;

SELECT 
    REPLACE(descricao, 'Ultrabook leve 13"', 'Ultrabook leve 13') AS descricao_atualizada
FROM Produtos;

SELECT id, TRIM(UPPER(nome)) AS nome_sem_espacos
FROM Produtos;


