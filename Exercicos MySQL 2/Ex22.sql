-- 22. Apresentar uma relação contendo: nome,plano, descrição do plano e valor de todos os associados que tenham em 
--     seu nome, seja na posição que for, a seqüência AMARAL.
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
	NOME LIKE '%AMARAL%';