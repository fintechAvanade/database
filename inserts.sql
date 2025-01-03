use DB_FINTECH
go


begin TRAN

go
insert into tb_usuario VALUES 
('peter paker', '69228182024', '1989-01-01' , 'peter@email.com', '1140028922', '', 'senha123@', '', 'c', 0), 
('lois lane', '07781582098', '1952-04-01' , 'lois@email.com', '1140028922', '', 'senha123@', '', 'c', 0), 
('clark kent', '00927129086', '1975-09-10' , 'clark@email.com', '1140028922', '', 'senha123@', '', 'c', 0), 
('bruce wayne', '24482463000', '1996-12-30' , 'bruce@email.com', '1140028922', '', 'senha123@', '', 'c', 0),
('cleiton da silva', '41394632010', '2000-11-30' , 'cleitinho@email.com', '1140028922', '', 'senha123@', '', 'c', 0);

select * from TB_USUARIO

go
insert into TB_CONTA VALUES 
(8, '2123', '27307548-2', 0, '1234', 1),
(9, '1220', '36506-8', 0, '1234', 1),
(10, '0815', '135359-4', 0, '1234', 1),
(11, '3367', '1298913-P', 0, '1234', 1),
(12, '8883', '81233-4', 0, '1234', 1);

select * from TB_CONTA

go 
insert into TB_TIPO_CHAVE_PIX VALUES
('cpf'),('telefone'),('email'),('chave aleatória')

select * from TB_TIPO_CHAVE_PIX

go
INSERT INTO TB_TIPO_MOVIMENTACAO (nome, percentual_taxa)
VALUES ('Depósito em conta corrente', 0.5),
       ('Saque em caixa eletrônico', 1.0),
       ('Transferência entre contas', 0.3),
       ('Pagamento de boleto', 0.2),
       ('Débito automático', 0.1),
       ('Compra com cartão de débito', 0.0),
       ('Compra com cartão de crédito', 0.0),
       ('Recebimento de salário', 0.0),
       ('Pix', 0.0),
       ('Pagamento de fatura de cartão de crédito', 0.15),
       ('Investimento em poupança', 0.0);

select * from TB_TIPO_MOVIMENTACAO

go
insert into TB_STATUS_MOVIMENTACAO VALUES ('pendente'),('erro'),('sucesso');

select * from TB_STATUS_MOVIMENTACAO

go
INSERT into TB_MOVIMENTACAO VALUES 
(3, 7, 4, '894946189498465156489166548964631668', getdate(), 100, null, 20, 120),
(3, 6, 4, '1220 36506-8', getdate(), 100, null, 30, 130),
(3, 12, 4, '00927129086', getdate(), 100, null, 0, 100);

select * from TB_MOVIMENTACAO

commit;

select * from TB_MOVIMENTACAO m join TB_TIPO_MOVIMENTACAO tm on m.ID_TIPO_MOVIMENTACAO = tm.ID join TB_CONTA c on m.DESTINO = c.AGENCIA + ' ' + c.NUMERO_CONTA

select * from TB_USUARIO