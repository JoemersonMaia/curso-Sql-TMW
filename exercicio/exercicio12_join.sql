SELECT 
count(DISTINCT t1.IdTransacao) AS qtdeTransacose,
datetime(substr(t1.DtCriacao, 1, 10)) AS dtCriacaoNova,
strftime('%m', datetime(substr(t1.DtCriacao, 1, 10))) AS mesNome

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.Idtransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t3.DescNomeProduto = 'Lista de presença'

GROUP BY mesNome 

LIMIT 100