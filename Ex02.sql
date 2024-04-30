-- 2. Extrair uma relação geral de todos os associados e os planos que eles possuem.
SELECT * FROM PLANOS
INNER JOIN ASSOCIADOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO;