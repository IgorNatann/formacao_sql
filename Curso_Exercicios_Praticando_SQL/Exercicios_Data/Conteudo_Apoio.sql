--Dicas rápidas

--SQL Server:

-- 1 . Função 'NOW' atual: GETDATE() / SYSDATETIME();
-- 2 . Função 'CURDATE' atual: GETDATE();
-- 3 . Função 'DATE' (extrai a data): CAST(coluna AS DATE) ou CONVERT(DATE, coluna);
-- 4 . Função STRFTIME: FORMAT(coluna, 'formato')
-- 5 . Função DATEDIFF: DATEDIFF(unidade, data_inicial, data_final)
-- 6 . Função EXTRACT: DATEPART(coluna, tabela)
-- 7 . Função DATE_ADD: DATEADD(intervalo, número, data)