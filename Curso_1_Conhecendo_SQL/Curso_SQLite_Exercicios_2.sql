-- CLIENTES
CREATE TABLE dbo.clientes (
  id             INT IDENTITY(1,1) PRIMARY KEY,
  nome           NVARCHAR(100) NOT NULL,
  cidade         NVARCHAR(100) NULL,
  data_cadastro  DATE NOT NULL CONSTRAINT DF_clientes_data DEFAULT (CONVERT(date, GETDATE()))
);
GO

-- PRODUTOS
CREATE TABLE dbo.produtos (
  id        INT IDENTITY(1,1) PRIMARY KEY,
  nome      NVARCHAR(120) NOT NULL,
  categoria NVARCHAR(80)  NOT NULL,
  preco     DECIMAL(10,2) NOT NULL CONSTRAINT CK_produtos_preco_nonneg CHECK (preco >= 0)
);
GO

-- PEDIDOS
CREATE TABLE dbo.pedidos (
  id           INT IDENTITY(1,1) PRIMARY KEY,
  cliente_id   INT NOT NULL,
  data_pedido  DATETIME2(0) NOT NULL CONSTRAINT DF_pedidos_data DEFAULT (SYSUTCDATETIME()),
  status       NVARCHAR(20) NOT NULL
    CONSTRAINT CK_pedidos_status CHECK ([status] IN (N'ABERTO', N'PAGO', N'ENVIADO', N'ENTREGUE', N'CANCELADO')),
  CONSTRAINT FK_pedidos_clientes
    FOREIGN KEY (cliente_id) REFERENCES dbo.clientes(id)
    ON UPDATE NO ACTION ON DELETE NO ACTION
);
GO

-- ITENS_DO_PEDIDO
CREATE TABLE dbo.itens_pedido (
  pedido_id       INT NOT NULL,
  produto_id      INT NOT NULL,
  quantidade      INT NOT NULL CONSTRAINT CK_itens_qtd_pos CHECK (quantidade > 0),
  preco_unitario  DECIMAL(10,2) NOT NULL CONSTRAINT CK_itens_preco_nonneg CHECK (preco_unitario >= 0),
  CONSTRAINT PK_itens_pedido PRIMARY KEY (pedido_id, produto_id),
  CONSTRAINT FK_itens_pedido_pedidos
    FOREIGN KEY (pedido_id) REFERENCES dbo.pedidos(id)
    ON UPDATE NO ACTION ON DELETE CASCADE, -- se apagar pedido, apaga itens
  CONSTRAINT FK_itens_pedido_produtos
    FOREIGN KEY (produto_id) REFERENCES dbo.produtos(id)
    ON UPDATE NO ACTION ON DELETE NO ACTION
);
GO

-- Índices úteis
CREATE INDEX IX_pedidos_cliente       ON dbo.pedidos(cliente_id);
CREATE INDEX IX_produtos_categoria    ON dbo.produtos(categoria);
CREATE INDEX IX_itens_produto         ON dbo.itens_pedido(produto_id);
GO
