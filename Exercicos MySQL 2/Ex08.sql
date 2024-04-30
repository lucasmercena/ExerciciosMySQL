-- 8. Apresente uma relação completa de todos os campos de ambas as tabelas em que o associado possua SILVA no nome.
SELECT * FROM PLANOS
INNER JOIN ASSOCIADOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO;
