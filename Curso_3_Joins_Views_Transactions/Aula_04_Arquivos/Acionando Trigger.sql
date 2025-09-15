
-- Inserindo novos pedidos e acionando a trigger
SELECT * from Faturamentodiario;


INSERT INTO Pedidos (ID, IDCliente, DataHoraPedido, Status)
VALUES (451, 27, '2023-10-07 14:30:00', 'Em Andamento');

INSERT INTO ItensPedidoS
(IDPedido, IDProduto, Quantidade, PrecoUnitario)
VALUES(451, 14, 1, 6.0),
      (451, 13, 1, 7.0);


SELECT * from Faturamentodiario;


INSERT INTO Pedidos (ID, IDCliente, DataHoraPedido, Status)
VALUES (452, 28, '2023-10-07 14:35:00', 'Em Andamento');

INSERT INTO ItensPedidos
(IDPedido, IDProduto, Quantidade, PrecoUnitario)
VALUES(452, 10, 1, 5.0),
      (452, 31, 1, 12.50);

SELECT * from Faturamentodiario;

SELECT * from Pedidos;

SELECT * from itenspedidos;