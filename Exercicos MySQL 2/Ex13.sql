-- 13. Quais são os associados que possuem plano do tipo EXECUTIVO, independentemente da categoria ser 1, 2 ou 3?
SELECT 
	ASSOCIADOS.NOME,
    ASSOCIADOS.PLANO,
    PLANOS.DESCRICAO,
    PLANOS.VALOR
FROM 
	ASSOCIADOS
JOIN PLANOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
WHERE
	PLANO LIKE '%E%'
ORDER BY 
	PLANO;