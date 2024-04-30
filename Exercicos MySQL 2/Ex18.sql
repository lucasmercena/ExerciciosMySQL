-- 18. Faça uma relação geral de todos os associados e planos que eles possuem. A relação deve ser apresentada em ordem 
--     ascendente pelo campo tipo de plano e descendente pelo campo de identificação do nome do associado.
SELECT * FROM ASSOCIADOS
JOIN PLANOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
ORDER BY ASSOCIADOS.PLANO ASC, ASSOCIADOS.NOME DESC;