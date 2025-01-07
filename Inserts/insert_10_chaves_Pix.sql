USE DB_FINTECH
GO

BEGIN TRAN
GO

INSERT INTO TB_CHAVE_PIX (ID_CONTA, TIPO_CHAVE_PIX, VALOR_CHAVE_PIX, ATIVO) VALUES
(1, 'CPF', '69228182024', 1),
(2, 'Email', 'joao.silva@example.com', 1),
(3, 'Telefone', '21987654321', 1),
(4, 'CPF', '34567890123', 1),
(5, 'Email', 'ana.pereira@example.com', 1),
(6, 'Telefone', '51987654321', 1),
(7, 'CPF', '67890123456', 1),
(8, 'Email', 'rafael.almeida@example.com', 1),
(9, 'Telefone', '81987654321', 1),
(10, 'CPF', '01234567890', 1);

SELECT * FROM TB_CHAVE_PIX

COMMIT;