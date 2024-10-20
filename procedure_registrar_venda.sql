CREATE OR REPLACE PROCEDURE registrar_venda (
    p_id_venda NUMBER,
    p_id_produto NUMBER,
    p_quantidade_vendida NUMBER,
    p_data_venda DATE
) IS
BEGIN
    INSERT INTO vendas (id_venda, id_produto, quantidade_vendida, data_venda)
    VALUES (p_id_venda, p_id_produto, p_quantidade_vendida, p_data_venda);
    
    UPDATE produtos
    SET quantidade_estoque = quantidade_estoque - p_quantidade_vendida
    WHERE id_produto = p_id_produto;
END;
