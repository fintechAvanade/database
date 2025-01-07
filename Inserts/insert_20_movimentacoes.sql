USE DB_FINTECH
GO

BEGIN TRAN
GO

INSERT INTO TB_MOVIMENTACAO (ID_STATUS_MOVIMENTACAO, ID_CONTA, TIPO_MOVIMENTACAO, DIRECAO, DATA_HORA, DESCRICAO, VALOR_MOVIMENTACAO, VALOR_PERCENTUAL_TAXA, VALOR_TOTAL, CODIGO_MOVIMENTACAO) VALUES
(2, 1, 'Transferência', 'C', '2025-01-01 10:00:00', 'Transferência recebida', 500.00, 0.01, 505.00, NEWID()),
(2, 1, 'Pagamento', 'D', '2025-01-02 15:00:00', 'Pagamento de conta', 200.00, 0.01, 202.00, NEWID()),
(2, 2, 'Depósito', 'C', '2025-01-03 09:00:00', 'Depósito em conta', 1000.00, 0.01, 1010.00, NEWID()),
(2, 2, 'Saque', 'D', '2025-01-04 12:00:00', 'Saque em caixa eletrônico', 300.00, 0.01, 303.00, NEWID()),
(2, 3, 'Transferência', 'C', '2025-01-05 14:00:00', 'Transferência recebida', 700.00, 0.01, 707.00, NEWID()),
(2, 3, 'Pagamento', 'D', '2025-01-06 16:00:00', 'Pagamento de boleto', 150.00, 0.01, 151.50, NEWID()),
(2, 4, 'Depósito', 'C', '2025-01-07 11:00:00', 'Depósito em conta', 1200.00, 0.01, 1212.00, NEWID()),
(2, 4, 'Saque', 'D', '2025-01-08 13:00:00', 'Saque em caixa eletrônico', 400.00, 0.01, 404.00, NEWID()),
(2, 5, 'Transferência', 'C', '2025-01-09 10:00:00', 'Transferência recebida', 800.00, 0.01, 808.00, NEWID()),
(2, 5, 'Pagamento', 'D', '2025-01-10 15:00:00', 'Pagamento de conta', 250.00, 0.01, 252.50, NEWID()),
(2, 6, 'Depósito', 'C', '2025-01-11 09:00:00', 'Depósito em conta', 1500.00, 0.01, 1515.00, NEWID()),
(2, 6, 'Saque', 'D', '2025-01-12 12:00:00', 'Saque em caixa eletrônico', 500.00, 0.01, 505.00, NEWID()),
(2, 7, 'Transferência', 'C', '2025-01-13 14:00:00', 'Transferência recebida', 900.00, 0.01, 909.00, NEWID()),
(2, 7, 'Pagamento', 'D', '2025-01-14 16:00:00', 'Pagamento de boleto', 300.00, 0.01, 303.00, NEWID()),
(2, 8, 'Depósito', 'C', '2025-01-15 11:00:00', 'Depósito em conta', 1800.00, 0.01, 1818.00, NEWID()),
(2, 8, 'Saque', 'D', '2025-01-16 13:00:00', 'Saque em caixa eletrônico', 600.00, 0.01, 606.00, NEWID()),
(2, 9, 'Transferência', 'C', '2025-01-17 10:00:00', 'Transferência recebida', 1000.00, 0.01, 1010.00, NEWID()),
(2, 9, 'Pagamento', 'D', '2025-01-18 15:00:00', 'Pagamento de conta', 350.00, 0.01, 353.50, NEWID()),
(2, 10, 'Depósito', 'C', '2025-01-19 09:00:00', 'Depósito em conta', 2000.00, 0.01, 2020.00, NEWID()),
(2, 10, 'Saque', 'D', '2025-01-20 12:00:00', 'Saque em caixa eletrônico', 700.00, 0.01, 707.00, NEWID());
GO

SELECT * FROM TB_MOVIMENTACAO

COMMIT;
