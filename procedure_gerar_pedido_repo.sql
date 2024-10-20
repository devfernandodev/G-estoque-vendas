CREATE OR REPLACE PROCEDURE gerar_pedido_reposicao_manual (
    p_id_produto NUMBER,
    p_quantidade_pedida NUMBER
) IS
BEGIN
    INSERT INTO pedidos_reposicao (id_pedido, id_produto, quantidade_pedida, data_pedido)
    VALUES (pedidos_reposicao_seq.NEXTVAL, p_id_produto, p_quantidade_pedida, SYSDATE);
END;
/
