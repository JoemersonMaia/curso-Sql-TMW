--Clientes mais antigos, tem mais frequência de transação?
--5f8fcbe0-6014-43f8-8b83-38cf2f4887b3

SELECT
        t1.DtCriacao,
        julianday('now') - julianday(substr(t1.DtCriacao, 1,19)) AS IdadeBase,
        count(t2.IdTransacao) AS QtdeTransacoes

FROM clientes AS t1

LEFT JOIN  transacoes AS t2
ON t1.Idcliente = t2.IdCliente

GROUP BY t1.IdCliente, IdadeBase