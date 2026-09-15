--Quais clientes assinaram a lista de presença no dia 2025/08/25?IdCliente
SELECT 
t1.IdCliente,
t1.DtCriacao,
t3.IdProduto,
t3.DescNomeProduto

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.Idtransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.Idproduto = t3.Idproduto

WHERE t1.DtCriacao >= '2025-08-25'
AND t1.DtCriacao < '2025-08-26'
AND DescNomeProduto = 'Lista de presença'