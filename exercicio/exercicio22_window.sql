--Qual o dia da semana mais ativo de cada usuário?
WITH tb_qtde_transacoes_dia AS( 
    SELECT 
    IdCliente,
    strftime('%w', datetime(substr(DtCriacao,1,19))) AS DiaSemana,
    count(IdTransacao) qtdeTransacoes
    FROM transacoes 

    GROUP BY IdCLiente, DiaSemana
),

tb_rn AS(
    SELECT
    *,
    Row_Number() OVER (PARTITION BY IdCliente ORDER BY qtdeTransacoes DESC) AS MelhorDia
    FROM tb_qtde_transacoes_dia
)

SELECT *
FROM tb_rn
WHERE MelhorDia = 1