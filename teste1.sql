    SELECT

    IdCliente,
    count(DISTINCT IdCliente) AS clientes_curso_sql,
    DtCriacao 

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'