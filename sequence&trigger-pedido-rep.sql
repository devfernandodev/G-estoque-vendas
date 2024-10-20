
CREATE SEQUENCE pedidos_reposicao_seq
START WITH 1
INCREMENT BY 1
NOCACHE;



CREATE OR REPLACE TRIGGER trg_atualizar_estoque
AFTER INSERT ON vendas
FOR EACH ROW
DECLARE
    v_quantidade_estoque produtos.quantidade_estoque%TYPE;
    v_quantidade_minima produtos.quantidade_minima%TYPE;
BEGIN
    SELECT quantidade_estoque, quantidade_minima INTO v_quantidade_estoque, v_quantidade_minima
    FROM produtos
    WHERE id_produto = :NEW.id_produto;
    
    IF v_quantidade_estoque < v_quantidade_minima THEN
        INSERT INTO pedidos_reposicao (id_pedido, id_produto, quantidade_pedida, data_pedido)
        VALUES (pedidos_reposicao_seq.NEXTVAL, :NEW.id_produto, (v_quantidade_minima - v_quantidade_estoque + :NEW.quantidade_vendida), SYSDATE);
    END IF;
END;


