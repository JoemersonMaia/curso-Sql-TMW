--Saldo de pontos acumulado de cada usuário
SELECT 
IdCliente,
sum(QtdePontos)
FROM transacoes

GROUP BY IdCliente