use DB_FINTECH
go

BEGIN TRANSACTION

go
insert into tb_usuario VALUES 
('peter paker', '69228182024', '1989-01-01' , 'peter@email.com', '1140028922', 'peter.parker', 'senha123@', '', 'c', 0);

select * from TB_USUARIO

go
insert into TB_CONTA VALUES 
(3, '2123', '27307548-2', 0, '1234', 1);

select * from TB_CONTA


go
insert into TB_STATUS_MOVIMENTACAO VALUES ('pendente'),('erro'),('sucesso');

select * from TB_STATUS_MOVIMENTACAO

go
INSERT into TB_MOVIMENTACAO VALUES 
(3, 2, 'Pagamento de boleto','C', getdate(), 'pagamento de boleto', 100, 0, 100, NEWID());


select * from TB_MOVIMENTACAO

COMMIT;
ROLLBACK;