-- 20. Apresentar uma listagem em ordem crescente pelo campo nome do associado. Essa listagem deve ser formada pelos 
--     campos Nome da tabela associado e Descrição da tabela Planos
SELECT 
	ASSOCIADOS.NOME, 
    PLANOS.DESCRICAO
FROM 
	ASSOCIADOS
INNER JOIN 
	PLANOS
ON 
	ASSOCIADOS.PLANO = PLANOS.NUMERO
ORDER BY
	NOME;