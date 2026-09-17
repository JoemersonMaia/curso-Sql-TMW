--12. Dentre os clientes de janeiro/2025, 
--quantos assistiram o curso de SQL?

WITH tb_cliente_inicio AS(
    SELECT 
    IdCliente,
    count(DISTINCT idCliente) AS clientes_janeiro_2025,
    DtCriacao
    FROM transacoes

    WHERE DtCriacao >= '2025-01-01'
    AND DtCriacao < '2025-02-01'

    GROUP BY IdCliente
    
),

tb_cliente_curso_sql AS(
    SELECT
    IdCliente,
    count(DISTINCT IdCliente) AS clientes_curso_sql,
    DtCriacao 
    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    GROUP BY IdCliente

)

    SELECT 

    sum(t1.clientes_janeiro_2025) AS qtdePessoasJaneiro,
    sum(t2.clientes_curso_sql) AS qtdePessoasCurso, 
    sum(t1.clientes_janeiro_2025) - sum(t2.clientes_curso_sql)

    FROM  tb_cliente_inicio AS t1

    LEFT JOIN tb_cliente_curso_sql AS t2
    ON t1.IdCliente = t2.IdCliente
