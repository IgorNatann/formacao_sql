BEGIN TRANSACTION;

SELECT * FROM clientes;

SELECT * FROM Pedidos;

UPDATE Pedidos SET Status = 'Concluído' ;

DELETE FROM clientes;

ROLLBACK;



BEGIN TRANSACTION;

SELECT * FROM Pedidos;

UPDATE Pedidos SET Status = 'Concluído' WHERE status = 'Em Andamento';

COMMIT;
