DECLARE @CONTA_ORIGEM INT = 2

SELECT 
        C.AGENCIA AS [Agência], 
        C.NUMERO_CONTA AS [Conta],
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
    WHERE M.DIRECAO = 'D' AND M.ID_CONTA = @CONTA_ORIGEM