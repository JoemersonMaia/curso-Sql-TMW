--Clientes mais antigos, tem mais frequência de transação?
--5f8fcbe0-6014-43f8-8b83-38cf2f4887b3

SELECT *
FROM transacoes

WHERE IdCLiente = '5f8fcbe0-6014-43f8-8b83-38cf2f4887b3'

ORDER BY DtCriacao DESC