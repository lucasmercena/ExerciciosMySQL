-- 19. Apresentar uma relação de todos os associados que não possuem o plano Máster.
SELECT * FROM ASSOCIADOS
WHERE PLANO NOT LIKE '%M%';