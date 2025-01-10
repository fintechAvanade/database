USE DB_FINTECH
GO

SELECT * FROM TB_CONTA

BEGIN TRAN
GO

-- ADICIONAR DEPOSITO
INSERT INTO TB_MOVIMENTACAO (
    ID_STATUS_MOVIMENTACAO, 
    ID_CONTA, 
    TIPO_MOVIMENTACAO, 
    DIRECAO, 
    DATA_HORA, 
    DESCRICAO, 
    VALOR_MOVIMENTACAO, 
    VALOR_PERCENTUAL_TAXA, 
    VALOR_TOTAL, 
    CODIGO_MOVIMENTACAO
    ) VALUES
(1, 1, 'Deposito', 'D', GETDATE(), 'Deposito em caixa eletronico', 2000, 0, 2000, NEWID()),
(1, 2, 'Deposito', 'D', GETDATE(), 'Deposito em caixa eletronico', 2000, 0, 2000, NEWID()),
(1, 3, 'Deposito', 'D', GETDATE(), 'Deposito em caixa eletronico', 2000, 0, 2000, NEWID()),
(1, 4, 'Deposito', 'D', GETDATE(), 'Deposito em caixa eletronico', 2000, 0, 2000, NEWID()),
(1, 5, 'Deposito', 'D', GETDATE(), 'Deposito em caixa eletronico', 2000, 0, 2000, NEWID()),
(1, 6, 'Deposito', 'D', GETDATE(), 'Deposito em caixa eletronico', 2000, 0, 2000, NEWID()),
(1, 7, 'Deposito', 'D', GETDATE(), 'Deposito em caixa eletronico', 2000, 0, 2000, NEWID()),
(1, 8, 'Deposito', 'D', GETDATE(), 'Deposito em caixa eletronico', 2000, 0, 2000, NEWID()),
(1, 9, 'Deposito', 'D', GETDATE(), 'Deposito em caixa eletronico', 2000, 0, 2000, NEWID()),
(1, 10, 'Deposito', 'D', GETDATE(), 'Deposito em caixa eletronico', 2000, 0, 2000, NEWID());

GO

-- ATUALIZAR SALDO DAS CONTAS

UPDATE TB_CONTA SET TB_CONTA.SALDO = 2000;

GO

-- Selecionando chave pix 

SELECT CP.TIPO_CHAVE_PIX,
	   CP.VALOR_CHAVE_PIX,
	   C.ID AS [ID CONTA],
	   C.AGENCIA,
	   C.NUMERO_CONTA,
	   C.SALDO,
	   C.ATIVO,
	   C.TIPO_CONTA
FROM TB_CHAVE_PIX CP INNER JOIN TB_CONTA C
ON CP.ID_CONTA = C.ID
WHERE VALOR_CHAVE_PIX = '69228182024'

-- Fazer pix entre contas

INSERT INTO TB_MOVIMENTACAO (
    ID_STATUS_MOVIMENTACAO, 
    ID_CONTA, 
    TIPO_MOVIMENTACAO, 
    DIRECAO, 
    DATA_HORA, 
    DESCRICAO, 
    VALOR_MOVIMENTACAO, 
    VALOR_PERCENTUAL_TAXA, 
    VALOR_TOTAL, 
    CODIGO_MOVIMENTACAO
    ) VALUES
(3, 1, 'Pix', 'C', GETDATE(), 'Transferencia pix - barzin sexta', 50, 0, 50, 'bb217d4a-01a8-43a7-8507-fc9b07f0d3a9'),
(3, 2, 'Pix', 'D', GETDATE(), 'Transferencia pix - barzin sexta', 50, 0, 50, 'bb217d4a-01a8-43a7-8507-fc9b07f0d3a9');

GO

UPDATE TB_CONTA SET SALDO = SALDO - 50 WHERE ID = 1;
GO
UPDATE TB_CONTA SET SALDO = SALDO + 50 WHERE ID = 2;
GO


-- MOSTRAR STATUS AQUII
SELECT * FROM TB_MOVIMENTACAO WHERE CODIGO_MOVIMENTACAO = 'bb217d4a-01a8-43a7-8507-fc9b07f0d3a9';

GO

UPDATE TB_MOVIMENTACAO SET ID_STATUS_MOVIMENTACAO = 1 WHERE CODIGO_MOVIMENTACAO = 'bb217d4a-01a8-43a7-8507-fc9b07f0d3a9';

GO



COMMIT;


--MOSTRAR EXTRATO

-- Extrato da conta de origem

DECLARE @CONTA_ORIGEM INT = 1
DECLARE @CONTA_DESTINO INT = 2
DECLARE @CODIGO_MOVIMENTACAO UNIQUEIDENTIFIER = 'bb217d4a-01a8-43a7-8507-fc9b07f0d3a9'

SELECT 
        C.AGENCIA AS [Agência], 
        C.NUMERO_CONTA AS [Conta],
        (SELECT U.NOME FROM TB_MOVIMENTACAO M 
        INNER JOIN TB_CONTA C ON M.ID_CONTA = C.ID
        INNER JOIN TB_USUARIO U ON C.ID_USUARIO = U.ID
        WHERE M.DIRECAO = 'D' AND M.CODIGO_MOVIMENTACAO = @CODIGO_MOVIMENTACAO ) AS [Para],
        M.CODIGO_MOVIMENTACAO AS [Código da Transação], 
        SM.NOME_STATUS AS [Status],
        M.TIPO_MOVIMENTACAO AS [Tipo da Movimentação],
        CASE 
            WHEN M.DIRECAO = 'D' THEN 'Entrada' 
            ELSE 'Saída' 
        END AS [Direção],
        M.DATA_HORA AS [Data],
        M.DESCRICAO AS [Descrição],
        M.VALOR_MOVIMENTACAO AS [Valor],
        M.VALOR_PERCENTUAL_TAXA AS [Taxa],
        M.VALOR_TOTAL AS [Valor Total],
        C.SALDO AS [Saldo Atual]
    FROM TB_MOVIMENTACAO M
    INNER JOIN TB_CONTA C ON M.ID_CONTA = C.ID
    INNER JOIN TB_STATUS_MOVIMENTACAO SM ON M.ID_STATUS_MOVIMENTACAO = SM.ID
    WHERE M.DIRECAO = 'C' AND M.ID_CONTA = @CONTA_ORIGEM


-- Extrato conta de destino
SELECT 
        C.AGENCIA AS [Agência], 
        C.NUMERO_CONTA AS [Conta],
        (SELECT U.NOME FROM TB_MOVIMENTACAO M 
        INNER JOIN TB_CONTA C ON M.ID_CONTA = C.ID
        INNER JOIN TB_USUARIO U ON C.ID_USUARIO = U.ID
        WHERE M.DIRECAO = 'C' AND M.CODIGO_MOVIMENTACAO = @CODIGO_MOVIMENTACAO) AS [De],
        M.CODIGO_MOVIMENTACAO AS [Código da Transação], 
        SM.NOME_STATUS AS [Status],
        M.TIPO_MOVIMENTACAO AS [Tipo da Movimentação],
        CASE 
            WHEN M.DIRECAO = 'D' THEN 'Entrada' 
            ELSE 'Saída' 
        END AS [Direção],
        M.DATA_HORA AS [Data],
        M.DESCRICAO AS [Descrição],
        M.VALOR_MOVIMENTACAO AS [Valor],
        M.VALOR_PERCENTUAL_TAXA AS [Taxa],
        M.VALOR_TOTAL AS [Valor Total],
        C.SALDO AS [Saldo Atual]
    FROM TB_MOVIMENTACAO M
    INNER JOIN TB_CONTA C ON M.ID_CONTA = C.ID
    INNER JOIN TB_STATUS_MOVIMENTACAO SM ON M.ID_STATUS_MOVIMENTACAO = SM.ID
    WHERE M.DIRECAO = 'D' AND M.ID_CONTA = @CONTA_DESTINO AND M.TIPO_MOVIMENTACAO = 'Pix'



-- CONFIRMAÇÃO DOS NOMES DE USUÁRIO E CONTA
    SELECT * FROM TB_CONTA INNER JOIN TB_USUARIO ON TB_CONTA.ID_USUARIO = TB_USUARIO.ID