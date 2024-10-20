CREATE TABLE pedidos_reposicao (
    id_pedido NUMBER PRIMARY KEY,
    id_produto NUMBER,
    quantidade_pedida NUMBER,
    data_pedido DATE,
    CONSTRAINT fk_produto_reposicao FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
