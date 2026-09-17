SELECT 

count(DISTINCT IdCliente) 

FROM transacoes AS t1


WHERE substr(DtCriacao, 1, 10) = '2025-08-25'

AND t1.IdCliente IN(
    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-29'
)