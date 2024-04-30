-- 4. Apresente uma relação com todos os nomes, planos e valores de todos os registros de associados.
SELECT 
	ASSOCIADOS.NOME,
    ASSOCIADOS.PLANO,
    PLANOS.DESCRICAO,
    PLANOS.VALOR
FROM 
	PLANOS
INNER JOIN ASSOCIADOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO;