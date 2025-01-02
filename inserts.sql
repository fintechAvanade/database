begin TRAN

insert into tb_usuario VALUES ('josé da silva', '90778228010', '2003-08-20' , 'jose.silva@email.com', '1140028922', 'jose.silva', 'senha123@', '2025-01-02', 'c', 0);
insert into tb_usuario VALUES ('maria de jesus', '12345678912', '2003-08-20' , 'maria.jesus@email.com', '1140028922', 'maria.jesus', 'senha123@', '2025-01-02', 'c', 0);

select * from tb_usuario

insert into TB_CONTA VALUES (1, '0001', '123456789-1', 0, '1234', 1);
insert into TB_CONTA VALUES (1, '0001', '987654321-1', 0, '1234', 1);

select * from TB_CONTA

insert into TB_TIPO_MOVIMENTACAO VALUES ('pix', 0);

SELECT * from TB_TIPO_MOVIMENTACAO

insert into TB_STATUS_MOVIMENTACAO VALUES ('realizado')

select * from TB_STATUS_MOVIMENTACAO

INSERT into TB_MOVIMENTACAO VALUES (1, 2, 1, '894946189498465156489166548964631668', getdate(), 10, null, 0, 10);
INSERT into TB_MOVIMENTACAO VALUES (1, 1, 1, '0001 987654321-1', getdate(), 10, null, 0, 10);

select * from TB_MOVIMENTACAO m join TB_TIPO_MOVIMENTACAO tm on m.ID_TIPO_MOVIMENTACAO = tm.ID


commit;

select * from TB_MOVIMENTACAO m join TB_TIPO_MOVIMENTACAO tm on m.ID_TIPO_MOVIMENTACAO = tm.ID join TB_CONTA c on m.DESTINO = c.AGENCIA + ' ' + c.NUMERO_CONTA