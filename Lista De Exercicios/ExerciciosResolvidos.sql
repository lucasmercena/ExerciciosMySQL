-- CRIE UM BANDO DE DADOS COM O NOME VENDAS
CREATE DATABASE VENDAS;
USE VENDAS;

-- Criar a Tabela duplicata (contas a receber)
-- CRIANDO TABELA DE CONTAS A RECEBER.
CREATE TABLE DUPLICATA(
	NOME CHAR(50),
    NUMERO INT NOT NULL,
    VALOR DECIMAL(10,2),
    VENCIMENTO DATE,
    BANCO CHAR(50),
    PRIMARY KEY(NUMERO)
)DEFAULT CHARSET = utf8mb4;

-- Após montar a estrutura da tabela indicada, deve ser efetuada a entrada dos registros do departamento de contas a receber.
-- INSERINDO DADOS NA TABELA.
INSERT INTO DUPLICATA (NOME, NUMERO, VALOR, VENCIMENTO, BANCO) VALUES 
('ABC PAPELARIA', 100100, 5000.00, '2017/01/20', 'ITAU'),
('LIVRARIA FERNANDES', '100110', 2500.00, '2017/01/22', 'ITAU'),
('LIVRARIA FERNANDES', '100120', 1500.00, '2016/10/15', 'BRADESCO'),
('ABC PAPELARIA', '100130', 8000.00, '2016/10/15', 'SANTANDER'),
('LER E SABER', '200120', 10500.00, '2018/04/26', 'BANCO DO BRASIL'),
('LIVROS E CIA', '200125', 2000.00, '2018/04/26', 'BANCO DO BRASIL'),
('LER E SABER', '200130', 11000.00, '2018/09/26', 'ITAU'),
('PAPELARIA SILVA', 250350, 1500.00, '2018/09/26', 'BRADESCO'),
('LIVROS MM', 250360, 500.00, '2018/12/18', 'SANTANDER'),
('LIVROS MM', 250370, 3400.00, '2018/04/26', 'SANTANDER'),
('PAPELARIA SILVA', 250380, 3500.00, '2018/04/26', 'BANCO DO BRASIL'),
('LIVROS E CIA', 453360, 1500.00, '2018/06/15', 'ITAU'),
('LIVROS MM', 453365, 5400.00, '2018/06/15', 'BRADESCO'),
('PAPELARIA SILVA', 453370, 2350.00, '2017/12/27', 'ITAU'),
('LIVROS E CIA', 453380, 1550.00, '2017/12/27', 'BANCO DO BRASIL'),
('ABC PAPELARIA', 980130, 4000.00, '2016/12/11', 'ITAU'),
('LIVRARIA FERNANDES', 770710, 2500.00, '2016/11/15', 'SANTANDER'),
('ABC PAPELARIA', 985001, 3000.00, '2016/09/11', 'ITAU'),
('PAPEL E AFINS', 985002, 2500.00, '2016/03/12', 'SANTANDER'),
('LER E SABER', 888132, 2500.00, '2017/03/05', 'ITAU');

-- 1. Listar nome,vencimento e valor de cada duplicata da tabela. 
-- LISTANDO NOME, VENCIMENTO E VALOR DE TODOS OS DADOS DA TABELA. 
SELECT NOME, VENCIMENTO, VALOR FROM DUPLICATA;

-- 2. Apresentar o número das duplicatas depositadas no banco Itaú 
-- APRESENTANDO TODOS OS NUMEROS DAS DUPLICATAS DEPOSITADAS NO BANCO ITAU
SELECT NOME, NUMERO FROM DUPLICATA WHERE BANCO = 'ITAU';

-- 3. Apresentar o número de duplicatas depositadas no banco Itaú 
-- APRESENTANDO TOTAL DE DUPLICATAS DEPOSITADAS NO ITAU. 
SELECT COUNT(*) AS TOTAL FROM DUPLICATA
WHERE BANCO = 'ITAU';

-- 4. Quais são as duplicatas (número, vencimento, valor e nome) que vencem no ano de 2017. 
-- DUPLICATAS QUE VENCEM NO ANO DE 2017:
SELECT NUMERO, VENCIMENTO, VALOR, NOME FROM DUPLICATA
WHERE YEAR(VENCIMENTO) = 2017; 

-- 5. Apresentar as duplicatas (número, vencimento, valor e nome) que não estão depositadas nos bancos Itaú e Santander. 
-- DUPLICADAS QUE NÃO FORAM DEPOSITADAS NO SANTANDER E ITAU:
SELECT NUMERO, VENCIMENTO, VALOR, NOME FROM DUPLICATA
WHERE BANCO <> 'ITAU' AND BANCO <> 'SANTANDER';

-- 6. Quanto é o valor da divida o cliente PAPELARIA SILVA, e quais são as duplicatas? 
-- VALOR TOTAL DAS DUPLICATAS DA PAPELARIA SILVA.
SELECT SUM(VALOR) AS TOTAL_DIVIDA FROM DUPLICATA WHERE NOME = 'PAPELARIA SILVA'; 
SELECT * FROM DUPLICATA WHERE NOME = 'PAPELARIA SILVA'; 

-- 7. Retirar da tabela a duplicata 770710 do cliente LIVRARIA FERNANDES, por ter sido devidamente quitada. 
-- O CLIENTE LIVRARIA FERNANDO QUITOU A DUPLICATA 770710. ESSA DUPLICATA PRECISA SER RETIRADA DO BANCO DE DADOS
DELETE FROM DUPLICATA 
WHERE NUMERO = 770710;
-- RALIZANDO UMA CONSULTA PARA CONFERIR SE O VALOR FOI REALMENTE REMOVIDO DO BANCO DE DADOS.
SELECT * FROM DUPLICATA
WHERE NUMERO = 770710;

-- 8. Apresentar uma listagem em ordem alfabética por nome do cliente de todos os campos da tabela.
SELECT * FROM DUPLICATA
ORDER BY NOME;

-- 9. Apresentar uma listagem em ordem de data de vencimento com o nome do cliente, banco, valor e vencimento.
SELECT NOME, BANCO, VALOR, VENCIMENTO FROM DUPLICATA
ORDER BY VENCIMENTO;

-- 10. As duplicatas do Banco do Brasil foram transferidas para o Santander. Proceder o ajuste dos registros.
UPDATE DUPLICATA SET BANCO = 'SANTANDER'
WHERE BANCO = 'BANCO DO BRASIL';

-- 11. Quais são os clientes que possuem suas duplicatas depositadas no Banco Bradesco? 
SELECT NOME, VALOR FROM DUPLICATA 
WHERE BANCO = 'BRADESCO';

-- 12. Qual é a previsão de recebimento no período de 01/01/2016 até 31/12/2016?
SELECT SUM(VALOR) AS VALOR_A_RECEBER FROM DUPLICATA
WHERE VENCIMENTO >= '2016/01/01' AND VENCIMENTO <= '2016/12/31';

-- 13. Quanto a empresa tem para receber no período de 01/10/2016 até 30/10/2016?
SELECT SUM(VALOR) AS VALOR_A_RECEBER FROM DUPLICATA
WHERE VENCIMENTO >= '2016/10/01' AND VENCIMENTO <= '2016/10/30';

-- 15. Acrescentar uma multa de 15% para todos os títulos que se encontram vencidos no período de 01/01/2016 até 31/12/2016. 
SELECT NOME, VENCIMENTO, VALOR FROM DUPLICATA WHERE YEAR(VENCIMENTO) = '2016';
SELECT nome, valor, valor + round((VALOR/100)*15, 2) AS novo_valor FROM DUPLICATA; # Função para extrair o valor de 15% de cada duplicata.
UPDATE DUPLICATA
SET VALOR = (VALOR + (SELECT round((VALOR/100)*15, 2)))
WHERE 
	(SELECT VENCIMENTO WHERE YEAR(VENCIMENTO) = '2016');
-- REALIZANDO CONSULTA PARA VERIFICAR A ALTERAÇÃO DE VALOR    
SELECT NOME, VALOR, VENCIMENTO FROM DUPLICATA
WHERE YEAR(VENCIMENTO) = 2016;

-- 16. Acrescentar uma multa de 5% para todos os títulos vencidos entre 01/01/2017 e 31/05/2017 que sejam do cliente LER E SABER.
SELECT ROUND((VALOR/100)*5, 2) AS PORCET FROM DUPLICATA; # Função para extrair a porcentagem dos valores de cada duplicata.
UPDATE DUPLICATA
SET VALOR = VALOR + (SELECT ROUND((VALOR/100)*5, 2) AS NOVO_VALOR)
WHERE NOME = 'LER E SABER' AND MONTH(VENCIMENTO) >= 1 AND MONTH(VENCIMENTO) <= 5 AND YEAR(VENCIMENTO) = 2017;

-- Realizando consulta para verificar se foi feita a alteração corretamente.
SELECT NOME, VALOR FROM DUPLICATA
WHERE NOME = 'LER E SABER' AND MONTH(VENCIMENTO) >= 1 AND MONTH(VENCIMENTO) <= 5 AND YEAR(VENCIMENTO) = 2017;

-- 17. Qual é a média aritmética dos valores das duplicatas do ano de 2016? 
SELECT 
	ROUND(AVG(VALOR), 2)  AS 
    MEDIA_2016 FROM DUPLICATA
WHERE
	YEAR(VENCIMENTO) = 2016;
    
-- 18. Exiba as duplicatas e nome dos respectivos clientes que possuem duplicatas com valor superior a 10000,00?
SELECT
	NOME, VALOR FROM DUPLICATA
WHERE
	VALOR > 10000;

-- 19. Qual o valor total das duplicatas lançadas para o banco Santander?
SELECT * FROM DUPLICATA
WHERE
	BANCO = 'SANTANDER';

-- 20. Quais são os clientes que possuem suas duplicatas depositadas nos Bancos Bradesco ou Itaú?
SELECT NOME, VALOR, BANCO FROM DUPLICATA 
WHERE BANCO = 'BRADESCO' OR BANCO = 'ITAU'
ORDER BY BANCO;	

