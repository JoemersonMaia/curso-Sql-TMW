SELECT  IdTransacao,
        DtCriacao,
        datetime(substr(DtCriacao,1,19)) AS DtCriacaoNova,
        strftime('%w', datetime(substr(DtCriacao,1,19))) AS DiaSemana
FROM transacoes

WHERE DiaSemana = '6' or DiaSemana = '5'