USE DB_FINTECH
GO

ALTER TABLE TB_ENDERECO 
ALTER COLUMN CEP NVARCHAR(8) NOT NULL;
GO

ALTER TABLE TB_ENDERECO
ALTER COLUMN CIDADE NVARCHAR(50) NOT NULL;
GO

ALTER TABLE TB_ENDERECO 
ALTER COLUMN BAIRRO NVARCHAR(50) NOT NULL; 
GO

ALTER TABLE TB_ENDERECO 
ALTER COLUMN ENDERECO NVARCHAR(100) NOT NULL; 
GO

ALTER TABLE TB_ENDERECO 
ALTER COLUMN COMPLEMENTO NVARCHAR(50); 
GO

--SELECT * FROM TB_ENDERECO;

INSERT INTO TB_ENDERECO (CEP, CIDADE, BAIRRO, ENDERECO, ESTADO, NUMERO, COMPLEMENTO) 
VALUES
	('50711150','Recife', 'Cordeiro', 'Rua Major Quinteiro', 'PE', '82', 'Apto 105'),
	('50010000', 'Recife', 'Bairro do Recife', 'Rua Primeiro de Março', 'PE', '123', 'Apto 101'),
	('01001000', 'São Paulo', 'Sé', 'Praça da Sé', 'SP', 789, NULL),
	('20040000', 'Rio de Janeiro', 'Centro', 'Av. Rio Branco', 'RJ', 101, 'Cobertura'),
	('70040000', 'Brasília', 'Asa Sul', 'SQS 308', 'DF', 202, 'Bloco B, Apto 302'),
	('40130000', 'Salvador', 'Barra', 'Av. Sete de Setembro', 'BA', 303, 'Loja 3'),
	('80010000', 'Curitiba', 'Centro', 'Rua XV de Novembro', 'PR', 404, 'Sala 404'),
	('88010000', 'Florianópolis', 'Centro', 'Rua Felipe Schmidt', 'SC', 505, 'Apto 502'),
	('69010000', 'Manaus', 'Centro', 'Rua Eduardo Ribeiro', 'AM', 606, NULL);
GO


SELECT * FROM TB_ENDERECO