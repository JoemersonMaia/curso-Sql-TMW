WITH tb_cliente_dia AS(  
    SELECT 
    IdCliente,
    substr(DtCriacao, 1, 10) AS dtDia,
    count(DISTINCT IdTransacao)  AS qtdeTransacoes

    FROM transacoes 

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'
    
    GROUP BY IdCliente, dtDia
),

tb_lag AS(
    SELECT 
    *, 
    sum(qtdeTransacoes) OVER ( PARTITION BY IdCliente ORDER BY dtDia) AS acum,
    lag(qtdeTransacoes) OVER ( PARTITION BY IdCliente ORDER BY dtDia) AS lagtransacao
    FROM tb_cliente_dia
)


SELECT
*, 
1.* qtdeTransacoes / lagtransacao

FROM tb_lag