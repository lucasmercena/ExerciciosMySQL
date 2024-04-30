CREATE DATABASE db_longavida;
USE db_longavida;

-- Criando tabelas 
CREATE TABLE PLANOS (
	numero CHAR(2) PRIMARY KEY NOT NULL,
	descricao CHAR(40),
	valor DECIMAL(10,2)
);

CREATE TABLE ASSOCIADOS(
	plano CHAR(2) NOT NULL,
    nome 	CHAR(50) PRIMARY KEY NOT NULL,
    endereço CHAR(50),
    cidade CHAR(50),
    estado CHAR(2),
    CEP CHAR(9)
);

-- Inserindo dados nas tabelas.
INSERT INTO planos VALUES
('B1', 'BÁSICO 1', 200.00),
('B2', 'BÁSICO 2', 150.00),
('B3', 'BÁSICO 3', 100.00),
('E1', 'EXECUTIVO 1', 350.00),
('E2', 'EXECUTIVO 2', 300.00),
('E3', 'EXECUTIVO 3', 250.00),
('M1', 'MASTER 1', 500.00),
('M2', 'MASTER 2', 450.00),
('M3', 'MASTER 3', 400.00);

INSERT INTO associados VALUES
('B1', 'JOSÉ ANTONIO DA SILVA', 'R. FELIPE DO AMARAL, 3450', 'COTIA', 'SP', '06700-000'),
('B1', 'MARIA DA SILVA SOBRINHO', 'R. FELIPE DE JESUS, 1245', 'DIADEMA', 'SP', '09960-170'),
('B1', 'PEDRO JOSE DE OLIVEIRA', 'R. AGRIPINO DIAS, 155', 'COTIA', 'SP', '06700-011'),
('B2', 'ANTONIA DE FERNANDES', 'R. PE EZEQUIEL, 567', 'DIADEMA', 'SP' , '09960-175'),
('B2', 'ANTONIO DE PRADO', 'R. INDIO TABAJARA, 55', 'GUARULHOS', 'SP', '07132-999'),
('B3', 'WILSON DE SENA', 'R. ARAPIRACA, 1234', 'OSASCO', 'SP', '06293-001'),
('B3', 'SILVIA DE ABREU', 'R. DR. JOAO DA SILVA', 'SANTO ANDRE', 'SP', '09172-112'),
('E1', 'ODETE DA CONCEIÇÃO', 'R. VOLUNTARIOS DA PATRIA, 10', 'SÃO PAULO', 'SP', '02010-550'),
('E2', 'JOAO CARLOS MACEDO', 'R. VISTA ALEGRE, 500', 'SÃO PAULO', 'SP', '04343-990'),
('E3', 'CONCEIÇÃO DA SILVA', 'AV. VITORIO DO AMPARO, 11', 'MAUA', 'SP', '09312-988'),
('E3', 'PAULO BRUNO AMARAL', 'R. ARGENZIO BRILHANTE, 88', 'BARUERI', 'SP', '06460-999'),
('E3', 'WALDENICE DE OLIVEIRA', 'R. OURO VELHO, 12', 'BARUERI', 'SP', '06460-998'),
('E3', 'MARCOS DO AMARAL', 'R. DO OUVIDOR, 67', 'GUARULHOS', 'SP', '07031-555'),
('M1', 'MURILO DE SANTANA', 'R. PRATA DA CASA', 'BARUERI', 'SP', '06455-111'),
('M1', 'LUIZA ONOFRE FREITAS', 'R. VICENTE DE ABREU, 55', 'SANTO ANDRE', 'SP', '09060-667'),
('M2', 'MELISSA DE ALMEIDA', 'R. FERNANDO ANTONIO, 2345', 'SAO PAULO', 'SP', '04842-987'),
('M2', 'JOAO INACIO DA CONCEIÇÃO', 'R. PENELOPE CHARMOSA, 34', 'SUZANO', 'SP', '08670-888'),
('B3', 'AUGUSTA DE ABREU', 'AV. RIO DA SERRA, 909', 'SANTO ANDRE', 'SP', '09061-333'),
('M3', 'ILDA DE MELO DA CUNHA', 'AV. POR DO SOL, 546', 'SANTO ANDRE', 'SP', '09199-444'),
('M3', 'MARCOS DA CUNHA', 'AV. PEDROSO DE MORAES', 'SÃO PAULO', 'SP', '04040-444');

####################### RESOLUÇÃO ##########################
-- 1. Quais campos das tabelas associado e plano devem ser utilizados para efetuar o relacionamento entre as tabelas?
	# O CAMPO PLANO DA TABELA associados E O CAMPO NUMERO DA TABELA planos
    
-- 2. Extrair uma relação geral de todos os associados e os planos que eles possuem.
SELECT * FROM PLANOS
INNER JOIN ASSOCIADOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO;

-- 3. Quantos associados possuem o plano B1?
SELECT 
	COUNT(PLANO) AS QNTD_PLANO_B1 
FROM 
	ASSOCIADOS
WHERE 
	PLANO = 'B1';
    
-- 4. Apresente uma relação com todos os nomes, planos e valores de todos os registros de associados.
SELECT 
	ASSOCIADOS.NOME,
    ASSOCIADOS.PLANO,
    PLANOS.DESCRICAO,
    PLANOS.VALOR
FROM 
	PLANOS
INNER JOIN ASSOCIADOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO;

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

-- 6. Apresente o nome, plano e valor dos associados que moram em BARUERI e possuem o plano M1.
SELECT
	ASSOCIADOS.NOME,
    ASSOCIADOS.CIDADE,
    ASSOCIADOS.PLANO,
    PLANOS.DESCRICAO,
    PLANOS.VALOR
FROM 
	PLANOS
INNER JOIN ASSOCIADOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
WHERE
	ASSOCIADOS.PLANO = 'M1' AND ASSOCIADOS.CIDADE = 'BARUERI';
    
-- 7. Apresente uma relação com nome, plano e valor de todos os associados residentes na cidade de SÃO PAULO.
SELECT	
	ASSOCIADOS.NOME,
    ASSOCIADOS.CIDADE, 
    ASSOCIADOS.PLANO,
    PLANOS.DESCRICAO,
    PLANOS.VALOR
FROM 
	PLANOS
INNER JOIN ASSOCIADOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
WHERE
	CIDADE = 'SAO PAULO';
    
-- 8. Apresente uma relação completa de todos os campos de ambas as tabelas em que o associado possua SILVA no nome.
SELECT * FROM PLANOS
INNER JOIN ASSOCIADOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO;

-- 9. Devido ao aumento do índice IGPM (Índece Geral Dos Preços), a empresa reajustou os valores 
--    dos planos básicos em 10%, dos planos executivos em 5% e dos planos Máster em 3 %. Atualize 
--    os valores na tabela planos.

# ATUALIZANDO VALORES DOS PLANOS BÁSICOS:
SELECT NUMERO, VALOR FROM PLANOS WHERE DESCRICAO LIKE '%BASICO%';
UPDATE PLANOS
SET VALOR = VALOR + ROUND((VALOR/100) * 10)
WHERE DESCRICAO LIKE '%BASICO%';
-- CONSULTANDO ATUALIZAÇÃO
SELECT NUMERO, VALOR FROM PLANOS 
WHERE DESCRICAO LIKE '%BASICO%';
#-------------------------------------------------------------------#
# ATUALIZANDO VALORES DOS PLANOS EXECUTIVOS:
SELECT NUMERO, VALOR FROM PLANOS WHERE DESCRICAO LIKE '%EXECUTIVO%';
UPDATE PLANOS
SET VALOR = VALOR + ROUND((VALOR/100) * 5)
WHERE DESCRICAO LIKE '%EXECUTIVO%';
-- CONSULTANDO ATUALIZAÇÃO
SELECT NUMERO, VALOR FROM PLANOS 
WHERE DESCRICAO LIKE '%EXECUTIVO%';
#-------------------------------------------------------------------#
# ATUALIZANDO VALORES DOS PLANOS MASTER:
SELECT NUMERO, VALOR FROM PLANOS WHERE DESCRICAO LIKE '%MASTER%';
UPDATE PLANOS
SET VALOR = VALOR + ROUND((VALOR/100) * 3)
WHERE DESCRICAO LIKE '%MASTER%';
-- CONSULTANDO ATUALIZAÇÃO
SELECT NUMERO, VALOR FROM PLANOS 
WHERE DESCRICAO LIKE '%MASTER%';
#-------------------------------------------------------------------#
-- 10. O associado PEDRO JOSE DE OLIVEIRA alterou seu plano de B1 para E3. Faça a devida atualização.
UPDATE 
	ASSOCIADOS
SET 
	PLANO = 'E3'
WHERE 
	NOME LIKE '%PEDRO JOSE DE OLIVEIRA%';
-- CONSULTANDO ATUALIZAÇÃO 
SELECT * FROM ASSOCIADOS
WHERE NOME LIKE '%PEDRO JOSE%';

-- 11. Quantos associados possuem o plano E3?
SELECT
	COUNT(PLANO) AS QNTD_PLANOS_E3
FROM 
	ASSOCIADOS
WHERE 
	PLANO = 'E3';

-- 12.Liste o nome e o valor de todos os associados que possuem os planos B1, E1 e M1.
SELECT 
	ASSOCIADOS.NOME, 
    ASSOCIADOS.PLANO,
    PLANOS.VALOR 
FROM 
	PLANOS
INNER JOIN ASSOCIADOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
WHERE 
	PLANOS.NUMERO IN ('B1', 'E1', 'M1')
ORDER BY 
	PLANO;

-- 13. Quais são os associados que possuem plano do tipo EXECUTIVO, independentemente da categoria ser 1, 2 ou 3?
SELECT 
	ASSOCIADOS.NOME,
    ASSOCIADOS.PLANO,
    PLANOS.DESCRICAO,
    PLANOS.VALOR
FROM 
	ASSOCIADOS
JOIN PLANOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
WHERE
	PLANO LIKE '%E%'
ORDER BY 
	PLANO;
    
-- 14. Quais são os associados que possuem plano dos tipos Básico e Máster?
SELECT
	ASSOCIADOS.NOME,
    ASSOCIADOS.CIDADE,
    ASSOCIADOS.PLANO,
    PLANOS.DESCRICAO
FROM 
	ASSOCIADOS
JOIN PLANOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
WHERE
	PLANOS.DESCRICAO
	LIKE 
		'%BASICO%' OR
	PLANOS.DESCRICAO
	LIKE
		'%MASTER%';

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
    
-- 16. Apresente o nome, plano e valor dos associados que moram em SÃO PAULO e possuem os planos M2 e M3. A 
--     listagem deve estar ordenada pelo campo nome.

SELECT 
	ASSOCIADOS.NOME, 
    ASSOCIADOS.CIDADE,
    ASSOCIADOS.PLANO, 
    PLANOS.VALOR 
FROM 
	ASSOCIADOS
JOIN PLANOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
WHERE 
	CIDADE = 'SAO PAULO'
    AND 
    PLANO = 'M2'
    OR 
    PLANO = 'M3'
ORDER BY 
	NOME;
    
-- 17. Apresente uma listagem completa de todos os campos de ambas as tabelas ordenados por tipo de plano.
SELECT * FROM ASSOCIADOS
JOIN PLANOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
ORDER BY DESCRICAO;

-- 18. Faça uma relação geral de todos os associados e planos que eles possuem. A relação deve ser apresentada em ordem 
--     ascendente pelo campo tipo de plano e descendente pelo campo de identificação do nome do associado.
SELECT * FROM ASSOCIADOS
JOIN PLANOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
ORDER BY ASSOCIADOS.PLANO ASC, ASSOCIADOS.NOME DESC;

-- 19. Apresentar uma relação de todos os associados que não possuem o plano Máster.
SELECT * FROM ASSOCIADOS
WHERE PLANO NOT LIKE '%M%';

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
    
-- 21.Apresentar uma listagem dos planos que estão situados na faixa de valores de 300 até 500
SELECT
	ASSOCIADOS.NOME,
    ASSOCIADOS.PLANO,
    PLANOS.VALOR
FROM
	ASSOCIADOS
JOIN PLANOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
WHERE
	PLANOS.VALOR
BETWEEN 
	300 AND 500;

-- 22. Apresentar uma relação contendo: nome,plano, descrição do plano e valor de todos os associados que tenham em 
--     seu nome, seja na posição que for, a seqüência AMARAL.
SELECT 
	ASSOCIADOS.NOME,
    ASSOCIADOS.PLANO,
    PLANOS.DESCRICAO,
    PLANOS.VALOR
FROM 
	ASSOCIADOS
JOIN PLANOS
ON ASSOCIADOS.PLANO = PLANOS.NUMERO
WHERE
	NOME LIKE '%AMARAL%';

-- 23. Quais associados residem na cidade de DIADEMA?
SELECT
	NOME, 
    ENDEREÇO,
    CIDADE
FROM
	ASSOCIADOS
WHERE
	CIDADE = 'DIADEMA';

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

-- 25. Quais são os clientes cujo CEP é iniciado com os valores 09?
SELECT 
	NOME, 
    ENDEREÇO,
    CEP
FROM 
	ASSOCIADOS
WHERE
	CEP LIKE '09%';