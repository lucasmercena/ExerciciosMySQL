-- 17. Apresente uma listagem completa de todos os campos de ambas as tabelas ordenados por tipo de plano.
SELECT * FROM ASSOCIADOS
JOIN PLANOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
ORDER BY DESCRICAO;