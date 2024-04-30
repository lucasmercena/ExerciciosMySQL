-- 23. Quais associados residem na cidade de DIADEMA?
SELECT
	NOME, 
    ENDEREÇO,
    CIDADE
FROM
	ASSOCIADOS
WHERE
	CIDADE = 'DIADEMA';