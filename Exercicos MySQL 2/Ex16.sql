-- 16. Apresente o nome, plano e valor dos associados que moram em SÃO PAULO e possuem os planos M2 e M3. A 
--     listagem deve estar ordenada pelo campo nome.
SELECT 
	ASSOCIADOS.NOME, 
    ASSOCIADOS.CIDADE,
    ASSOCIADOS.PLANO, 
    PLANOS.VALOR 
FROM 
	ASSOCIADOS
JOIN PLANOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
WHERE 
	CIDADE = 'SAO PAULO'
    AND 
    PLANO = 'M2'
    OR 
    PLANO = 'M3'
ORDER BY 
	NOME;