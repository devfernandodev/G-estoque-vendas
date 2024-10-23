create or replace PROCEDURE registrar_venda (
    p_id_produto NUMBER,
    p_quantidade_vendida NUMBER,
    p_data_venda DATE
) IS
BEGIN
    IF p_id_produto IS NULL THEN
        RAISE_APPLICATION_ERROR(-20006, 'O ID do produto não pode ser nulo.');
    ELSIF p_quantidade_vendida <= 0 THEN
        RAISE_APPLICATION_ERROR(-20007, 'A quantidade vendida deve ser maior que zero.');
    ELSIF p_data_venda IS NULL THEN
        RAISE_APPLICATION_ERROR(-20008, 'A data da venda não pode ser nula.');
    ELSE
        INSERT INTO vendas (id_venda, id_produto, quantidade_vendida, data_venda)
        VALUES (vendas_seq.NEXTVAL, p_id_produto, p_quantidade_vendida, p_data_venda);

        UPDATE produtos
        SET quantidade_estoque = quantidade_estoque - p_quantidade_vendida
        WHERE id_produto = p_id_produto;
    END IF;
END;
