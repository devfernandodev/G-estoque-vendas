CREATE OR REPLACE PROCEDURE gerar_relatorio_vendas (
    p_result OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_result FOR
    SELECT v.id_venda, p.nome, p.categoria, v.quantidade_vendida, v.data_venda, (v.quantidade_vendida * p.preco) AS valor_total
    FROM vendas v
    JOIN produtos p ON v.id_produto = p.id_produto;
END;
/
