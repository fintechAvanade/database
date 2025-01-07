use DB_FINTECH
go

BEGIN TRANSACTION

go
insert into tb_usuario VALUES 
('peter paker', '69228182024', '1989-01-01' , 'peter@email.com', '1140028922', 'peter.parker', 'senha123@', '', 'c', 0);

select * from TB_USUARIO

go
insert into TB_CONTA VALUES 
(1, '2123', '27307548-2', 0, '1234', 1);

select * from TB_CONTA


go
insert into TB_STATUS_MOVIMENTACAO VALUES ('pendente'),('erro'),('sucesso');

select * from TB_STATUS_MOVIMENTACAO

go
INSERT into TB_MOVIMENTACAO VALUES 
	(3, 1, 'Pagamento de boleto','C', getdate(), 'pagamento de boleto', 100, 0, 100, NEWID());


select * from TB_MOVIMENTACAO


INSERT INTO TB_CARTAO VALUES 
	(1, 8392746150283746, 887, '2026-12-05', 1)


GO

SELECT * FROM TB_CARTAO

INSERT INTO TB_CHAVE_PIX VALUES
	(1, 'cpf', '69228182024', 1)


GO



COMMIT;
--ROLLBACK;
