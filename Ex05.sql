-- 5. Quais são os associados que moram em COTIA ou em DIADEMA?
SELECT 
	NOME,
    ENDEREÇO,
    CIDADE
FROM 
	ASSOCIADOS
WHERE
	CIDADE = 'COTIA' OR CIDADE = 'DIADEMA'
ORDER BY CIDADE;