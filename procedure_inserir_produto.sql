create or replace PROCEDURE inserir_produto (
    p_id_produto NUMBER,
    p_nome VARCHAR2,
    p_categoria VARCHAR2,
    p_preco NUMBER,
    p_quantidade_estoque NUMBER,
    p_quantidade_minima NUMBER
) IS
BEGIN
    IF p_nome IS NULL OR p_nome = '' THEN
        RAISE_APPLICATION_ERROR(-20001, 'O nome do produto não pode ser nulo ou vazio.');
    ELSIF p_categoria IS NULL OR p_categoria = '' THEN
        RAISE_APPLICATION_ERROR(-20002, 'A categoria do produto não pode ser nula ou vazia.');
    ELSIF p_preco <= 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'O preço do produto deve ser maior que zero.');
    ELSIF p_quantidade_estoque < 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'A quantidade em estoque não pode ser negativa.');
    ELSIF p_quantidade_minima < 0 THEN
        RAISE_APPLICATION_ERROR(-20005, 'A quantidade mínima não pode ser negativa.');
    ELSE
        INSERT INTO produtos (id_produto, nome, categoria, preco, quantidade_estoque, quantidade_minima)
        VALUES (p_id_produto, p_nome, p_categoria, p_preco, p_quantidade_estoque, p_quantidade_minima);
    END IF;
END;
