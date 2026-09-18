SELECT 
IdCLiente, 
substr(DtCriacao, 1, 10) as dtDia
FROM transacoes

WHERE substr(DtCriacao, 1 ,4) = '2025'

ORDER BY IdCLiente, DtDia