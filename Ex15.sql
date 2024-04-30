-- 15. A empresa fechou seu escritório na cidade de SANTO ANDRE e transferiu os cliente para um terceirizado. Remova 
--     da tabela associados todos os registros existentes de associados da cidade de SANTO ANDRE
-- REALIZANDO CONSULTA PARA VERIFICAR OS CLIENTES DE SANTO ANDRE
	SELECT * FROM ASSOCIADOS
    WHERE CIDADE = 'SANTO ANDRE';
-- RESOLUÇÃO DO EXERCICIO:
DELETE FROM ASSOCIADOS
WHERE CIDADE = 'SANTO ANDRE';
-- REALIZANDO CONSULTA, PARA VER A ATUALIZAÇÃO DOS DADOS
	SELECT * FROM ASSOCIADOS
    WHERE CIDADE = 'SANTO ANDRE';