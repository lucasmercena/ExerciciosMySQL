-- 3. Quantos associados possuem o plano B1?
SELECT 
	COUNT(PLANO) AS QNTD_PLANO_B1 
FROM 
	ASSOCIADOS
WHERE 
	PLANO = 'B1';