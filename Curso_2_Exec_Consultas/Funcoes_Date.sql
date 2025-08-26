USE Executando_Consultas_SQL;

-- Fun��o YEAR para capturar apenas o Ano do atributo.
SELECT ID_Colaborador, YEAR(DataInicio) FROM Licencas;

-- Fun��o DATEDIFF para calcular a diferen�a em dias.
SELECT 
    ID_Colaborador, 
    DataContratacao, 
    DataTermino,
    DATEDIFF(DAY, DataContratacao, DataTermino) AS DiasTrabalhados
FROM HistoricoEmprego
WHERE DataTermino IS NOT NULL;

/* ===========================
   DEMONSTRA��O: Fun��es de Data no SQL Server
   Cole e execute no SSMS.
   =========================== */

-- Vari�veis de refer�ncia
DECLARE 
    @Agora           DATETIME      = GETDATE(),
    @AgoraPreciso    DATETIME2(7)  = SYSDATETIME(),
    @AgoraOffset     DATETIMEOFFSET = SYSDATETIMEOFFSET(),
    @Exemplo         DATETIME      = '2024-02-29 13:45:30'; -- data bissexta para testes

/* 1) Data/Hora atuais */
SELECT
    GETDATE()           AS GETDATE_,
    SYSDATETIME()       AS SYSDATETIME_,
    CURRENT_TIMESTAMP   AS CURRENT_TIMESTAMP_,
    SYSDATETIMEOFFSET() AS SYSDATETIMEOFFSET_;

/* 2) Extra��o de partes (num�rico e texto) */
SELECT
    @Agora                                  AS BaseDate,
    YEAR(@Agora)                            AS Ano,
    MONTH(@Agora)                           AS Mes,
    DAY(@Agora)                             AS Dia,
    DATEPART(WEEKDAY, @Agora)               AS DiaDaSemana_Num,
    DATENAME(WEEKDAY, @Agora)               AS DiaDaSemana_Nome,
    DATEPART(QUARTER, @Agora)               AS Trimestre_Num,
    DATENAME(MONTH, @Agora)                 AS Mes_Nome;

/* 3) C�lculos de diferen�a e adi��o */
SELECT
    @Exemplo                                                AS Exemplo,
    DATEADD(DAY, 10, @Exemplo)                              AS Exemplo_Plus10Dias,
    DATEADD(MONTH, -2, @Exemplo)                            AS Exemplo_Minus2Meses,
    DATEDIFF(DAY, @Exemplo, @Agora)                         AS Diferenca_Dias_Exemplo_para_Hoje,
    DATEDIFF(MONTH, @Exemplo, @Agora)                       AS Diferenca_Meses_Exemplo_para_Hoje,
    DATEDIFF(YEAR, @Exemplo, @Agora)                        AS Diferenca_Anos_Exemplo_para_Hoje;

/* 4) �ltimo dia do m�s (EOMONTH) */
SELECT
    @Agora                           AS Hoje,
    EOMONTH(@Agora)                  AS UltimoDiaMes_Atual,
    EOMONTH(@Agora, 1)               AS UltimoDiaMes_Seguinte,
    EOMONTH(@Exemplo)                AS UltimoDiaMes_DoExemplo;

/* 5) Formata��o e convers�o */
SELECT
    @Agora                                                   AS BaseDate,
    FORMAT(@Agora, 'dd/MM/yyyy')                             AS Format_ddMMyyyy,
    FORMAT(@Agora, 'dd/MM/yyyy HH:mm')                       AS Format_ComHoras,
    CONVERT(VARCHAR(10), @Agora, 103)                        AS Convert_103_ddMMyyyy,
    CONVERT(VARCHAR(19), @Agora, 120)                        AS Convert_120_ISOyyyy_mm_dd_hh_mm_ss;

/* 6) Timezone / datetimeoffset */
SELECT
    @AgoraOffset                                                 AS Agora_Offset,
    SWITCHOFFSET(@AgoraOffset, '+00:00')                         AS Em_UTC,
    SWITCHOFFSET(@AgoraOffset, '-03:00')                         AS Em_BRT_Menos3,
    TODATETIMEOFFSET(@Agora, '-03:00')                           AS Agora_Como_Offset_BRT;

/* 7) Exemplos combinados �teis no dia a dia */
-- a) Primeiro e �ltimo dia do m�s corrente
SELECT
    CAST(DATEFROMPARTS(YEAR(@Agora), MONTH(@Agora), 1) AS DATE)  AS PrimeiroDiaMes,
    CAST(EOMONTH(@Agora) AS DATE)                                AS UltimoDiaMes;

-- b) In�cio e fim da semana (assumindo semana come�ando no Monday)
;WITH Base AS (
    SELECT CAST(@Agora AS DATE) AS D
)
SELECT
    DATEADD(DAY, - ( (DATEPART(WEEKDAY, D) + 5) % 7 ), D)                AS InicioSemana_Mon,
    DATEADD(DAY, 6 - ( (DATEPART(WEEKDAY, D) + 5) % 7 ), D)              AS FimSemana_Sun
FROM Base;

-- c) Idade em anos completos dado uma data de nascimento
DECLARE @Nascimento DATE = '1990-08-26';
SELECT
    @Nascimento AS Nascimento,
    DATEDIFF(YEAR, @Nascimento, @Agora) 
      - CASE WHEN (MONTH(@Agora)*100 + DAY(@Agora)) < (MONTH(@Nascimento)*100 + DAY(@Nascimento)) THEN 1 ELSE 0 END
      AS Idade_Anos;

/* 8) Dica de ordena��o por ano/m�s/dia */
-- Ex.: ordenar por ano e m�s de DataContratacao
-- SELECT *
-- FROM HistoricoEmprego
-- ORDER BY YEAR(DataContratacao), MONTH(DataContratacao), DAY(DataContratacao);


