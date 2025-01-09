USE DB_FINTECH

GO

BEGIN TRANSACTION
GO
INSERT INTO TB_USUARIO (
	ID_ENDERECO,
	NOME, 
	CPF, 
	DATA_NASCIMENTO, 
	EMAIL, 
	TELEFONE, 
	USUARIO, 
	HASH_SENHA, 
	DATA_ULTIMO_ACESSO, 
	TIPO_USUARIO, 
	NUMERO_TENTATIVAS_ACESSO
) VALUES
(1,'João Silva', '12345678901', '1985-05-15', 'joao.silva@example.com', '11987654321', 'joaosilva', 'ef92b778bafe771e89245b89ecbc9a4c41c8bde1e9c3e1e4b648f15f7f52f8f0', '2025-01-01', 'C', 0),
(2,'Maria Oliveira', '23456789012', '1990-08-22', 'maria.oliveira@example.com', '21987654321', 'mariaoliveira', '73475cb40a568e8da8a03ef3b41e9b6c8a81b6f9b2f3b2a57f4f598c4a04daaa', '2025-01-02', 'A', 1),
(3,'Carlos Souza', '34567890123', '1978-12-05', 'carlos.souza@example.com', '31987654321', 'carlossouza', 'b63fb509baeb7a6b9dfb20f6f5b6f3af033705d0a09f7dbefc42365db4a27b2f', '2025-01-03', 'C', 2),
(4,'Ana Pereira', '45678901234', '1982-03-18', 'ana.pereira@example.com', '41987654321', 'anapereira', 'c90f3c0660c8b45b5a14a0412f6c1c9834cb332f9e94f86f0b7b5699c25c1f0d', '2025-01-04', 'A', 0),
(5,'Pedro Lima', '56789012345', '1995-07-30', 'pedro.lima@example.com', '51987654321', 'pedrolima', '5e884898da28047151d0e56f8dc6292773603d0d6aabbddc839dcde984c5e813', '2025-01-05', 'C', 1),
(6,'Fernanda Costa', '67890123456', '1988-11-11', 'fernanda.costa@example.com', '61987654321', 'fernandacosta', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441abf6f836993b373516e6a882', '2025-01-06', 'A', 2),
(7,'Rafael Almeida', '78901234567', '1992-02-25', 'rafael.almeida@example.com', '71987654321', 'rafaelalmeida', 'e99a18c428cb38d5f260853678922e03abd833647f6f1706e7a91b90a5f76fc0', '2025-01-07', 'C', 0),
(8,'Juliana Santos', '89012345678', '1980-06-14', 'juliana.santos@example.com', '81987654321', 'julianasantos', '6d0f6ebf0c0b4ca35b74a2f8fa4bd25b9f7d6863b4ef714cf1fdd214d7f4a2f3', '2025-01-08', 'A', 1),
(9,'Bruno Rocha', '90123456789', '1987-09-09', 'bruno.rocha@example.com', '91987654321', 'brunorocha', 'b15f17eb8a9cc4e3bc226a54954c00ad65d8007bc9735d34f0668c23178e5d9c', '2025-01-09', 'C', 2),
(9,'Patrícia Mendes', '01234567890', '1993-04-20', 'patricia.mendes@example.com', '10198765432', 'patriciamendes', '2b58cb5cf1e5c4fbc6942e4f8a62e4302b16c46f31c3f91e7419eec9a72a3e40', '2025-01-10', 'A', 0);
GO
COMMIT;
SELECT * FROM TB_USUARIO;