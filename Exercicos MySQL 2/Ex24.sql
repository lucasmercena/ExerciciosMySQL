-- 24. O plano do tipo MASTER teve um reajuste de 6%. Atualize na tabela planos os valores das categorias 1, 2 e 3.

-- REALIZANDO UMA CONSULTA PARA VER OS VALORES ANTES DA ATUALIZAÇÃO
SELECT NUMERO, VALOR FROM PLANOS
WHERE NUMERO LIKE 'M%';
-- Adicionando o reajuste de 6%:
UPDATE 
	PLANOS
SET VALOR = VALOR + ROUND((VALOR/100) * 6)
WHERE 
	DESCRICAO LIKE 'M%';
-- REALIZANDO CONSULTA PARA CONFERIR A ATUALIZAÇÃO:
SELECT NUMERO, VALOR FROM PLANOS
WHERE NUMERO LIKE 'M%';