-- 25. Quais são os clientes cujo CEP é iniciado com os valores 09?
SELECT 
	NOME, 
    ENDEREÇO,
    CEP
FROM 
	ASSOCIADOS
WHERE
	CEP LIKE '09%';