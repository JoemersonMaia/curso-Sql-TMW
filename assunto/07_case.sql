--de 0 a 500 ->ponei
--de 501 a 1000 -> ponei aprendiz
--de 1001 a 5000 -> Mago aprendiz
--de 5001 a 10000 ->Mago mestre
--10001 -> Mago supremo

SELECT idCliente,
        QtdePontos,
        CASE
            WHEN QtdePontos <= 500 THEN 'Ponei' 
            WHEN QtdePontos <= 1000 THEN 'Ponei Premium'
            WHEN QtdePontos <= 5000 THEN 'Mago Aprendiz'
            WHEN QtdePontos <= 10000 THEN 'Mago Mestre'
            ELSE 'Mago Supremo'
        END AS NomeGrupo,

        CASE 
            WHEN QtdePontos <= 1000 THEN 1
            ELSE 0
        END AS FlPonei,

        CASE 
            WHEN QtdePontos > 1000 THEN 1
            ELSE 0
        END AS FlMago

FROM clientes

WHERE FlMago = 1

ORDER BY QtdePontos DESC