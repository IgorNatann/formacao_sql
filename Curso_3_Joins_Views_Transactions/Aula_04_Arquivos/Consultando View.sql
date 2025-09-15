

SELECT * FROM ViewValorTotalPedido;


SELECT nome FROM ViewValorTotalPedido;

SELECT * FROM ViewValorTotalPedido
WHERE Valortotalpedido = 10;

SELECT * FROM ViewValorTotalPedido
WHERE Valortotalpedido > 10;


SELECT * FROM ViewValorTotalPedido
WHERE Valortotalpedido > 10 AND Valortotalpedido < 14;


SELECT * FROM ViewValorTotalPedido
WHERE strftime('%m', datahorapedido) = '08';
















