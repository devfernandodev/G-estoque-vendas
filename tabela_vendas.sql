CREATE TABLE vendas (
    id_venda NUMBER PRIMARY KEY,
    id_produto NUMBER,
    quantidade_vendida NUMBER,
    data_venda DATE,
    CONSTRAINT fk_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
