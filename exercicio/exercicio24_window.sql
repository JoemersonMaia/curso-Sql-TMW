--Quantidade de usuários cadastrados (absoluto e acumulado) ao longo do tempo?
WITH tb_qtdeCadastros AS (
    SELECT
    substr(DtCriacao, 1, 10) AS DtDia,
    count(DISTINCT idCliente) AS qtdeCadastro
    FROM Clientes

    GROUP BY DtDia

    ORDER BY DtCriacao
),

tb_abs_acum AS(
    SELECT
    *,
    sum(qtdeCadastro) OVER (ORDER BY dtDia) AS sumDia
    FROM tb_qtdeCadastros
)

SELECT 
*
FROM tb_abs_acum

WHERE sumDia >=3000