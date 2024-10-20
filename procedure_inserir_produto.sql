CREATE OR REPLACE PROCEDURE inserir_produto (
    p_id_produto NUMBER,
    p_nome VARCHAR2,
    p_categoria VARCHAR2,
    p_preco NUMBER,
    p_quantidade_estoque NUMBER,
    p_quantidade_minima NUMBER
) IS
BEGIN
    INSERT INTO produtos (id_produto, nome, categoria, preco, quantidade_estoque, quantidade_minima)
    VALUES (p_id_produto, p_nome, p_categoria, p_preco, p_quantidade_estoque, p_quantidade_minima);
END;
