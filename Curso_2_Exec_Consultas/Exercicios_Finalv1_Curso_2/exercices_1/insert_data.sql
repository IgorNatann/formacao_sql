/* === DADOS === */

INSERT INTO Clientes (primeiro_nome, ultimo_nome) VALUES
 ('Amanda','Souza'),
 ('Ana','Lima'),
 ('Bruna','Oliveira'),
 ('Carlos','Pereira'),
 ('Diego','Moura'),
 ('Eduardo','Santos'),
 ('Fernanda','Alves'),
 ('Gustavo','Nunes');

INSERT INTO Produtos (nome, descricao) VALUES
 ('Notebook X', 'Ultrabook leve 13"'),
 ('Mouse Óptico', NULL),
 ('Teclado Mecânico', 'Switch azul'),
 ('Monitor 27"', NULL),
 ('Headset Gamer', 'Surround 7.1');

INSERT INTO Funcionarios (nome, departamento, salario, data_nasc) VALUES
 -- nomes que começam com 'A' e terminam com 's' para o exercício
 ('Alanis',   'TI',     8000.00, '1994-03-12'),
 ('Alexis',   'TI',     7000.00, '1988-07-05'),
 ('Anders',   'Vendas', 5200.00, '1992-11-20'),
 -- outros
 ('Bruno',    'TI',     6000.00, '1985-01-15'),
 ('Carla',    'RH',     4000.00, '1997-09-02'),
 ('Daniel',   'RH',     4500.00, '1990-05-30'),
 ('Elisa',    'Financeiro', 5500.00, '1989-12-01'),
 ('Fábio',    'Vendas', 3000.00, '1996-06-18');

INSERT INTO Vendas (data_venda) VALUES
 ('2024-12-15'),
 ('2025-01-10'),
 ('2025-06-01'),
 ('2025-08-20');

INSERT INTO Pedidos (item, preco_total) VALUES
 ('Cadeira ergonômica',  999.50),
 ('Mesa de escritório',   1234.49),
 ('Luminária de mesa',      89.51),
 ('Organizador',            19.40);

INSERT INTO Eventos (data_string) VALUES
 ('2022-12-31'),
 ('2023-01-02'),
 ('2024-05-10'),
 ('2025-08-01');

INSERT INTO Avaliacoes (pontuacao) VALUES
 (2), (3), (4), (6), (7), (8), (9), (10);
