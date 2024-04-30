-- 11. Quantos associados possuem o plano E3?
SELECT
	COUNT(PLANO) AS QNTD_PLANOS_E3
FROM 
	ASSOCIADOS
WHERE 
	PLANO = 'E3';