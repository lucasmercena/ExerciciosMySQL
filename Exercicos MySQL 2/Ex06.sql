-- 6. Apresente o nome, plano e valor dos associados que moram em BARUERI e possuem o plano M1.
SELECT
	ASSOCIADOS.NOME,
    ASSOCIADOS.CIDADE,
    ASSOCIADOS.PLANO,
    PLANOS.DESCRICAO,
    PLANOS.VALOR
FROM 
	PLANOS
INNER JOIN ASSOCIADOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
WHERE
	ASSOCIADOS.PLANO = 'M1' AND ASSOCIADOS.CIDADE = 'BARUERI';