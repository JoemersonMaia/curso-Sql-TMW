SELECT t1.idTransacaoProduto, sum(QtdeProduto),
t2.DescCategoriaProduto
FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto

GROUP BY DescCategoriaProduto 

ORDER BY sum(QtdeProduto) DESC