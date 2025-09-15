

-- Criando a consulta

SELECT * FROM pedidos;
SELECT * FROM itenspedidos;

SELECT p.id, c.nome, p.datahorapedido, SUM(ip.precounitario) AS ValorTotalPedido
FROM clientes c
join pedidos p on c.id = p.idcliente
JOIN itenspedidos ip ON p.id = ip.idpedido
GROUP BY p.id, c.nome;


-- Criando a ViewCliente

CREATE VIEW ViewCliente AS
SELECT nome, endereco from clientes;

SELECT * FROM ViewCliente;

-- Criando a ViewValorTotalPedido

CREATE VIEW ViewValorTotalPedido AS
SELECT p.id, c.nome, p.datahorapedido, SUM(ip.precounitario) AS ValorTotalPedido
FROM clientes c
join pedidos p on c.id = p.idcliente
JOIN itenspedidos ip ON p.id = ip.idpedido
GROUP BY p.id, c.nome;

SELECT * FROM ViewValorTotalPedido;




