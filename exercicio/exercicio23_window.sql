--Saldo de pontos acumulado de cada usuário
WITH tb_cliente_dia AS(
    SELECT 
    IdCliente,
    substr(DtCriacao, 1, 10) AS dtDia,
    sum(QtdePontos) AS totalPontos,
    sum(CASE WHEN QtdePontos > 0 THEN QtdePontos ELSE 0 END) AS PontosPositivos
    FROM transacoes

    GROUP BY IdCliente, dtDia
)
SELECT 
*,
sum(totalPontos) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS saldodia,
sum(PontosPositivos) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS PontosPositivos

FROM tb_cliente_dia