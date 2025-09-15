
PRAGMA foreign_keys = ON;


-- Utilizando o UPDATE
SELECT * from produtos WHERE id = 31;

UPDATE produtos set preco = 13.0 WHERE id = 31;

SELECT * from produtos WHERE nome LIKE 'croissant%';

UPDATE produtos set descricao = 'Croissant recheado com amêndoas.' WHERE id = 28;



-- Utilizando o DELETE

SELECT * FROM colaboradores WHERE id = 3;

DELETE FROM colaboradores WHERE id = 3;


SELECT * FROM clientes where ID = 27;

SELECT * FROM pedidos where idcliente = 27;

SELECT * FROM itenspedidos where idpedido = 451;

DELETE FROM clientes WHERE id = 27;


UPDATE Pedidos SET Status = 'Concluído' ;















