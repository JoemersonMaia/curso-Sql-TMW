SELECT 
*
FROM relatorio_diario;

UPDATE relatorio_diario
SET qtdeTransacoes = 100000
WHERE  dtDia >= '2025-08-25'
;

SELECT 
*
FROM relatorio_diario;