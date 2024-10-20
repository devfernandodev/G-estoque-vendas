CREATE TABLE produtos (
    id_produto NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    categoria VARCHAR2(100),
    preco NUMBER(10, 2),
    quantidade_estoque NUMBER,
    quantidade_minima NUMBER
);