USE master

GO

ALTER DATABASE [DB_FINTECH] 
SET SINGLE_USER 
WITH ROLLBACK IMMEDIATE;

GO

DROP DATABASE DB_FINTECH

GO

CREATE DATABASE DB_FINTECH

GO

USE DB_FINTECH
GO

CREATE TABLE TB_USUARIO (
	ID INT NOT NULL IDENTITY(1,1),
	NOME NVARCHAR(50) NOT NULL,
	CPF NVARCHAR(11) NOT NULL,
	DATA_NASCIMENTO DATETIME2 NOT NULL,
	EMAIL NVARCHAR(150) NOT NULL,
	TELEFONE NVARCHAR(20) NOT NULL,
	USUARIO NVARCHAR(50) NOT NULL,
	HASH_SENHA VARCHAR(64) NOT NULL,
	DATA_ULTIMO_ACESSO DATETIME2,
	TIPO_USUARIO CHAR(1) NOT NULL,
	NUMERO_TENTATIVAS_ACESSO INT NOT NULL,
	ATIVO BIT DEFAULT 1 NOT NULL,

	PRIMARY KEY(ID),
	UNIQUE(USUARIO),
	UNIQUE(CPF),
	CHECK(TIPO_USUARIO = 'A' OR TIPO_USUARIO = 'C') --A: ADMINISTRADOR, C: CLIENTE
)
GO
CREATE TABLE TB_CONTA (
	ID INT NOT NULL IDENTITY(1,1),
	ID_USUARIO INT NOT NULL,
	AGENCIA NVARCHAR(4) NOT NULL,
	NUMERO_CONTA NVARCHAR(20) NOT NULL,
	SALDO FLOAT DEFAULT 0,
	HASH_SENHA_PAGAMENTO VARCHAR(64) NOT NULL,
	ATIVO BIT DEFAULT 1,
	TIPO_CONTA CHAR(1) NOT NULL,

	PRIMARY KEY(ID),
	FOREIGN KEY(ID_USUARIO) REFERENCES TB_USUARIO(ID),
	CHECK(SALDO >= 0),
	CHECK(TIPO_CONTA = 'S' OR TIPO_CONTA = 'E') -- S: simples, e: especial
)
GO
CREATE TABLE TB_CARTAO (
	ID INT NOT NULL IDENTITY(1,1),
	ID_CONTA INT NOT NULL,
	NUMERO_CARTAO NVARCHAR(30) NOT NULL,
	CVV NVARCHAR(3) NOT NULL,
	VALIDADE_CARTAO DATETIME2 NOT NULL,
	ATIVO BIT DEFAULT 1,

	PRIMARY KEY(ID),
	FOREIGN KEY(ID_CONTA) REFERENCES TB_CONTA(ID),
)

GO
CREATE TABLE TB_CHAVE_PIX(
	ID INT NOT NULL IDENTITY(1,1),
	ID_CONTA INT NOT NULL,
	TIPO_CHAVE_PIX NVARCHAR(50) NOT NULL,
	VALOR_CHAVE_PIX VARCHAR(50) NOT NULL,
	ATIVO BIT DEFAULT 1,

	PRIMARY KEY(ID),
	FOREIGN KEY(ID_CONTA) REFERENCES TB_CONTA(ID),
)

GO

CREATE TABLE TB_STATUS_MOVIMENTACAO(
	ID INT NOT NULL IDENTITY(1,1),
	NOME_STATUS VARCHAR(20),

	PRIMARY KEY(ID),
)
GO
 
CREATE TABLE TB_MOVIMENTACAO(
	ID INT NOT NULL IDENTITY(1,1),
	CODIGO_MOVIMENTACAO NVARCHAR(255) NOT NULL,
	ID_STATUS_MOVIMENTACAO INT NOT NULL,
	ID_CONTA INT NOT NULL,
	TIPO_MOVIMENTACAO NVARCHAR(50) NOT NULL,
	DIRECAO CHAR NOT NULL,
	DATA_HORA DATETIME2 NOT NULL,
	DESCRICAO VARCHAR(100) NULL,
	VALOR_MOVIMENTACAO FLOAT NOT NULL,
	VALOR_PERCENTUAL_TAXA FLOAT NULL,
	VALOR_TOTAL FLOAT NOT NULL,

	PRIMARY KEY(ID),
	FOREIGN KEY(ID_CONTA) REFERENCES TB_CONTA(ID),
	FOREIGN KEY(ID_STATUS_MOVIMENTACAO) REFERENCES TB_STATUS_MOVIMENTACAO(ID),
	CHECK(VALOR_PERCENTUAL_TAXA >= 0),
	CHECK(DIRECAO = 'C' OR DIRECAO = 'D') -- Crédito = C || Débito = D
)
GO

CREATE TABLE TB_INVESTIMENTO(
	ID INT NOT NULL IDENTITY(1,1),
	NOME_INVESTIMENTO NVARCHAR(30) NOT NULL,
	RENDIMENTO_DIARIO FLOAT NOT NULL,
	RESGATE_ANTECIPADO BIT NOT NULL DEFAULT 0,
	PREVISAO_RESGATE DATETIME2,

	PRIMARY KEY(ID)
)
GO

CREATE TABLE TB_CONTA_INVESTIMENTO(
	ID INT NOT NULL IDENTITY(1,1),
	ID_CONTA INT NOT NULL,
	ID_INVESTIMENTO INT NOT NULL,
	VALOR_APLICADO FLOAT NOT NULL
	PRIMARY KEY(ID)
	FOREIGN KEY(ID_CONTA) REFERENCES TB_CONTA(ID),
	FOREIGN KEY(ID_INVESTIMENTO) REFERENCES TB_INVESTIMENTO(ID),
)
GO

ALTER DATABASE [DB_FINTECH] 
SET MULTI_USER;

GO