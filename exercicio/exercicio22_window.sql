--Qual o dia da semana mais ativo de cada usuário?
WITH tb_qtde_transacoes_dia AS( 
    SELECT 
    IdCliente,
    strftime('%w', datetime(substr(DtCriacao,1,19))) AS DiaSemana,
    count(IdTransacao) qtdeTransacoes
    FROM transacoes 

    GROUP BY IdCLiente, DiaSemana

    ORDER BY IdCLiente, qtdeTransacoes DESC
)

SELECT
IdCliente,
Row_Number(qtdeTransacoes) OVER (ORDER BY DiaSemana) AS MelhorDia,
qtdeTransacoes
FROM tb_qtde_transacoes_dia