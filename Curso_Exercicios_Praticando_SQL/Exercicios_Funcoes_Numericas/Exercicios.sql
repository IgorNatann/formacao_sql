USE Funcoes_Numericas;

/*
A empresa que vende almofadas em formato de cubo, CuboComfort , deseja fazer uma análise financeira mensal para o ano de 2024. Ela possui um registro detalhado das vendas por mês, incluindo a quantidade de almofadas vendidas, o preço unitário de venda e o custo unitário de produção.

Sua missão é criar uma consulta em SQL que calcule a receita e o custo para cada mês de 2024 utilizando a tabela TabelaVendasMensais e ajudando na tomada de decisões estratégicas da empresa.

Solução esperada:

-- 1. A resposta para essa análise deve ser apresentada em forma de uma tabela que liste cada mês, ano, receitas (produto da quantidade pelo preço unitário) e despesas (produto da quantidade pelo custo unitário). A tabela resultante da consulta SQL deve ser a seguinte:
*/

SELECT 
    Mes,
    Ano,
    (Quantidade * PrecoUnitario) AS Receita,
    (Quantidade * CustoUnitario) AS Despesa
FROM TabelaVendasMensais
WHERE Ano = 2024;


/*
A CuboComfort deseja fazer uma nova análise financeira para o ano de 2024. Ela precisa calcular o lucro bruto mensal em 2024 para entender melhor suas operações financeiras.

Sua missão é criar uma consulta em SQL que calcule este indicador dado pela subtração do custo total das almofadas vendidas da receita total gerada pelas vendas em cada mês utilizando a tabela TabelaVendasMensais.

Solução esperada

-- 2. A resposta para esta análise deve ser apresentada em forma de uma tabela que liste cada mês, ano e o lucro bruto calculado. A tabela resultante da consulta SQL deve ser a seguinte:
*/

SELECT 
    Mes,
    Ano,
    (Quantidade * PrecoUnitario) - (Quantidade * CustoUnitario) AS LucroBruto
FROM TabelaVendasMensais
WHERE Ano = 2024;

/*
A CuboComfort, buscando aprimorar sua análise financeira para o ano de 2024, deseja calcular a margem de lucro bruto mensal. Este indicador ajudará a empresa a entender melhor a rentabilidade de suas operações.

Sua missão é criar uma consulta em SQL que calcule a margem de lucro bruto (em porcentagem) para cada mês de 2024 utilizando a tabela TabelaVendasMensais. Este indicador mostra a porcentagem de receita que se transforma em lucro após a dedução dos custos diretos associados à produção das almofadas.

Solução esperada

- 3. A resposta para esta análise deve ser apresentada em forma de uma tabela que liste cada mês, ano, e a margem de lucro bruto, arredondada para uma casa decimal. A tabela resultante da consulta SQL deve ser a seguinte:
*/

SELECT 
    Mes,
    Ano,
    CONVERT(DECIMAL(10,1),
        ROUND(((Quantidade * PrecoUnitario) - (Quantidade * CustoUnitario)) / (Quantidade * PrecoUnitario) * 100, 1)
    ) AS MargemLucroBruto
FROM TabelaVendasMensais
WHERE Ano = 2024;


/*
A CuboComfort deseja calcular desta vez o lucro líquido mensal para entender a real eficiência operacional após deduzir os impostos das receitas.

Sua missão é criar uma consulta em SQL que calcule o lucro líquido mensal para todos os meses do ano de 2024, levando em consideração que os impostos correspondem a 30% do custo total das almofadas vendidas. Para calcular esse indicador, você precisará utilizar a tabela TabelaVendasMensais e arredondar o resultado para duas casas decimais.

Solução esperada

- 4. A resposta para esta análise deve ser apresentada em forma de uma tabela que liste cada mês, ano, e o lucro líquido calculado. A tabela resultante da consulta SQL deve ser a seguinte:
*/

SELECT 
    Mes,
    Ano,
    CONVERT(DECIMAL(10,2),
        ROUND(((Quantidade * PrecoUnitario) - (Quantidade * CustoUnitario)) - ((Quantidade * CustoUnitario) * 0.30), 2)) 
FROM TabelaVendasMensais
WHERE Ano = 2024;


/*
A CuboComfort está agora focada em otimizar sua logística para envio de produtos. Para isso, ela precisa calcular o número mínimo de caixas necessárias para enviar as almofadas, considerando que cada caixa comporta até 8 almofadas.

Sua missão é criar uma consulta em SQL que calcule o número de caixas necessárias para uma amostra de 5 clientes, usando os dados de pedidos recentes. É fundamental que a quantidade de caixas seja a mínima possível, pois reduzirá os custos de frete.

Solução esperada

-- 5. A resposta para este problema deve ser apresentada em forma de uma tabela que liste o ID do pedido, a quantidade de almofadas vendidas e o número mínimo de caixas necessárias, utilizando a tabela TabelaPedidos. A tabela resultante da consulta SQL deve ser a seguinte:
*/

SELECT 
    id_pedido,
    QuantidadeVendida,
    CEILING(QuantidadeVendida / 8.0) AS NumeroCaixas   
FROM TabelaPedidos;

/*
A CuboComfort, uma empresa que vende almofadas em formato de cubo, deseja melhorar a experiência de compra de seus clientes oferecendo descontos baseados na quantidade de produtos adquiridos. Para isso, ela precisa calcular o valor final a pagar pelos clientes, já considerando os descontos aplicados.

Sua missão é criar uma consulta em SQL que calcule o preço total que cada cliente deve pagar após aplicar o desconto sobre o preço normal de venda das almofadas. É essencial que o valor seja arredondado para baixo para garantir que o cliente sempre receba o menor preço possível.

Solução esperada

-- 6. A resposta para este problema deve ser apresentada em forma de uma tabela que liste o ID do pedido, a quantidade de almofadas vendidas, o preço unitário, o desconto aplicado (que está no formato decimal, ou seja, 0.05 = 5%) e o preço total a pagar, utilizando a tabela TabelaPedidos. A tabela resultante da consulta SQL deve ser a seguinte:
*/

SELECT id_pedido,
       QuantidadeVendida,
       PrecoUnitario,
       Desconto,
       FLOOR((PrecoUnitario * QuantidadeVendida) * (1 - Desconto)) as PrecoTotal
FROM TabelaPedidos;

/*
A CuboComfort, em busca de avaliar e melhorar seu desempenho de vendas, está interessada em comparar as vendas mensais de 2024 com a média dos últimos cinco anos para cada mês correspondente. Essa análise ajudará a identificar tendências, desvios e oportunidades de crescimento.

Sua missão é criar uma consulta em SQL que calcule a diferença absoluta entre as vendas mensais de 2024 e a média das vendas dos últimos cinco anos para cada mês, de forma a avaliar se houve disparidade entre os valores independentemente se positiva ou negativa.

Solução esperada

-- 7. A resposta para esta análise deve ser apresentada em forma de uma tabela que liste cada mês, ano e a diferença absoluta nas vendas, utilizando a tabela TabelaMetasVendasMensais. A tabela resultante da consulta SQL deve ser a seguinte:
*/
SELECT 
    Mes,
    Ano,
    ABS(VendasMensais - MediaVendas5Anos) AS DiferencaAbsoluta  
FROM TabelaMetasVendasMensais
WHERE Ano = 2024;

/*
A CuboComfort está explorando oportunidades de crescimento a longo prazo. Para isso, deseja calcular o crescimento projetado das vendas de almofadas para os próximos cinco anos com base em uma taxa de crescimento composta estimada.

Sua missão é criar uma consulta em SQL que ajude a empresa a projetar o número de almofadas que espera vender ao longo do 5º ano, começando com uma base de vendas conhecida e uma taxa de crescimento anual específica.

-- 8. Solução esperada A resposta para este desafio deve ser apresentada em forma de uma tabela que liste o ano base, a quantidade de vendas base, e a projeção de vendas após cinco anos, utilizando a tabela TabelaEstimativaCrescimento. A tabela resultante da consulta SQL deve ser assim:
*/

SELECT Ano,
       VendasBase,
   FLOOR(POWER(1 + TaxaCrescimento, 5) * VendasBase) AS VendasProjecao5Anos
FROM TabelaEstimativaCrescimento;



/*
-- 9. A resposta para este problema deve ser apresentada em forma de uma tabela que liste o ID do pedido, a cidade do cliente, a distância calculada e o status da entrega, utilizando a tabela TabelaPedidos. Lembre-se de utilizar a cláusula CASE WHEN aprendida anteriormente para popular a coluna de StatusEntrega. A tabela resultante da consulta SQL deve ser a seguinte:
*/

SELECT id_pedido,
       CidadeCliente,
       ROUND(SQRT(POWER(Latitude - (-23.588161), 2) + POWER(Longitude - (-46.632344), 2)) * 111.19, 1) AS Distancia,
       CASE WHEN ROUND(SQRT(POWER(Latitude - (-23.588161), 2) + POWER(Longitude - (-46.632344), 2)) * 111.19, 1) < 60 
            THEN 'Entrega gratuita'
            ELSE 'Cobrar entrega'
       END AS StatusEntrega
FROM TabelaPedidos;

/*
A consulta SQL abaixo calcula a distância entre a sede da empresa e a localização dos clientes utilizando a função matemática SQRT para a raiz quadrada, POWER para o cálculo do quadrado das diferenças, e ROUND para arredondar a distância. O uso da cláusula CASE WHEN determina se a entrega é gratuita ou não com base na distância calculada, sendo a quantidade de caixas multiplicada por 50 reais quando o custo do frete for aplicável.
*/

SELECT id_pedido,
       CidadeCliente,
       ROUND(SQRT(POWER(Latitude - (-23.588161), 2) + POWER(Longitude - (-46.632344), 2)) * 111.19, 1) AS Distancia,
       CASE WHEN ROUND(SQRT(POWER(Latitude - (-23.588161), 2) + POWER(Longitude - (-46.632344), 2)) * 111.19, 1) < 60 
            THEN 0
            ELSE CEIL(QuantidadeVendida / 8.0) * 50
       END AS Frete
FROM TabelaPedidos;