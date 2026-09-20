--Quantidade de transações Acumuladas ao longo do tempo?
WITH tb_sum_transacoes AS(
    SELECT
    IdCliente,
    substr(DtCriacao, 1, 10) AS dtDia,
    count(DISTINCT IdTransacao) AS qtdeTransacoes
    FROM transacoes

    GROUP BY dtDia
    ORDER BY DtCriacao
),

tb_acum AS(
    SELECT
    *,
    sum(qtdeTransacoes) OVER (ORDER BY dtDia) AS sumDia
    FROM tb_sum_transacoes
)

SELECT 
*
FROM tb_acum
WHERE sumDia >= 100000