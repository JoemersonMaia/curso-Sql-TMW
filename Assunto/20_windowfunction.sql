WITH cliente_dia AS( 
    SELECT 
    DISTINCT IdCLiente, 
    substr(DtCriacao, 1, 10) as dtDia
    FROM transacoes

    WHERE substr(DtCriacao, 1 ,4) = '2025'
 
    ORDER BY IdCLiente, DtDia
),

tab_lag AS (
    SELECT 
    *,
    lag(dtDia) OVER (PARTITION BY IdCLiente ORDER BY dtDia) AS lagdia

    FROM cliente_dia
),

tb_diff_dt AS   (
    SELECT 
    *,
    julianday(dtDia) - julianday(lagDia) as DtDiff

    FROM tab_lag
),


avg_cliente AS (

    SELECT IdCLiente, avg(DtDiff) AS avgDia

    FROM tb_diff_dt
    GROUP BY IdCLiente
)

SELECT avg(avgDia) FROM avg_cliente