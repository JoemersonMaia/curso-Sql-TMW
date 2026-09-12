
SELECT  

t2.DescCategoriaProduto,
count(DISTINCT t1.idTransacaoProduto) AS qtdeTransacao


FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto

GROUP BY DescCategoriaProduto 

ORDER BY qtdeTransacao DESC

WHERE DtCriacao >= '2024-01-01'
AND DtCriacao < '2025-01-01'