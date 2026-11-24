-- Projeto: Conciliacao de Notas Fiscais x Pagamentos
-- Passo 1: cria as tabelas e carrega os dados ficticios.
-- SQL padrao: roda em SQLite (sqliteonline.com) e em Oracle (Oracle Live SQL).
-- As datas ficam em texto no formato AAAA-MM-DD para funcionar nos dois bancos.

CREATE TABLE notas (
  numero_nf     INTEGER PRIMARY KEY,
  cliente       VARCHAR(60),
  data_emissao  VARCHAR(10),
  valor         DECIMAL(10,2)
);

CREATE TABLE pagamentos (
  id_pagamento    INTEGER PRIMARY KEY,
  numero_nf       INTEGER,
  data_pagamento  VARCHAR(10),
  valor_pago      DECIMAL(10,2)
);

INSERT INTO notas VALUES (1001, 'Comercial Alfa Ltda', '2026-01-05', 3100.00);
INSERT INTO notas VALUES (1002, 'Auto Pecas Goias', '2026-01-07', 4200.00);
INSERT INTO notas VALUES (1003, 'Mercado Boa Vista', '2026-01-09', 780.00);
INSERT INTO notas VALUES (1004, 'Mercado Boa Vista', '2026-01-11', 3100.75);
INSERT INTO notas VALUES (1005, 'Comercial Alfa Ltda', '2026-01-13', 2750.50);
INSERT INTO notas VALUES (1006, 'Auto Pecas Goias', '2026-01-15', 350.00);
INSERT INTO notas VALUES (1007, 'Comercial Alfa Ltda', '2026-01-17', 780.90);
INSERT INTO notas VALUES (1008, 'Farmacia Saude Total', '2026-01-19', 2300.00);
INSERT INTO notas VALUES (1009, 'Clinica Vida Plena', '2026-01-21', 780.50);
INSERT INTO notas VALUES (1010, 'Farmacia Saude Total', '2026-01-23', 350.00);
INSERT INTO notas VALUES (1011, 'Papelaria Central', '2026-01-25', 1200.00);
INSERT INTO notas VALUES (1012, 'Mercado Boa Vista', '2026-01-27', 780.00);
INSERT INTO notas VALUES (1013, 'Mercado Boa Vista', '2026-01-29', 480.50);
INSERT INTO notas VALUES (1014, 'Clinica Vida Plena', '2026-01-31', 1200.00);
INSERT INTO notas VALUES (1015, 'Distribuidora Planalto', '2026-02-02', 350.75);
INSERT INTO notas VALUES (1016, 'Farmacia Saude Total', '2026-02-04', 2300.00);
INSERT INTO notas VALUES (1017, 'Clinica Vida Plena', '2026-02-06', 480.90);
INSERT INTO notas VALUES (1018, 'Construtora Horizonte', '2026-02-08', 3100.90);
INSERT INTO notas VALUES (1019, 'Mercado Boa Vista', '2026-02-10', 2750.00);
INSERT INTO notas VALUES (1020, 'Auto Pecas Goias', '2026-02-12', 350.75);
INSERT INTO notas VALUES (1021, 'Auto Pecas Goias', '2026-02-14', 950.00);
INSERT INTO notas VALUES (1022, 'Clinica Vida Plena', '2026-02-16', 480.50);
INSERT INTO notas VALUES (1023, 'Construtora Horizonte', '2026-02-18', 1850.75);
INSERT INTO notas VALUES (1024, 'Construtora Horizonte', '2026-02-20', 620.00);
INSERT INTO notas VALUES (1025, 'Clinica Vida Plena', '2026-02-22', 780.75);
INSERT INTO notas VALUES (1026, 'Mercado Boa Vista', '2026-02-24', 4200.75);
INSERT INTO notas VALUES (1027, 'Papelaria Central', '2026-02-26', 2750.75);
INSERT INTO notas VALUES (1028, 'Auto Pecas Goias', '2026-02-28', 2300.75);
INSERT INTO notas VALUES (1029, 'Farmacia Saude Total', '2026-03-02', 620.50);
INSERT INTO notas VALUES (1030, 'Auto Pecas Goias', '2026-03-04', 950.75);
INSERT INTO notas VALUES (1031, 'Comercial Alfa Ltda', '2026-03-06', 3100.00);
INSERT INTO notas VALUES (1032, 'Construtora Horizonte', '2026-03-08', 780.00);
INSERT INTO notas VALUES (1033, 'Mercado Boa Vista', '2026-03-10', 1500.00);
INSERT INTO notas VALUES (1034, 'Construtora Horizonte', '2026-03-12', 780.90);
INSERT INTO notas VALUES (1035, 'Distribuidora Planalto', '2026-03-14', 780.75);
INSERT INTO notas VALUES (1036, 'Distribuidora Planalto', '2026-03-16', 1500.75);
INSERT INTO notas VALUES (1037, 'Papelaria Central', '2026-03-18', 620.00);
INSERT INTO notas VALUES (1038, 'Clinica Vida Plena', '2026-03-20', 780.75);
INSERT INTO notas VALUES (1039, 'Farmacia Saude Total', '2026-03-22', 4200.90);
INSERT INTO notas VALUES (1040, 'Construtora Horizonte', '2026-03-24', 2750.50);

INSERT INTO pagamentos VALUES (5001, 1001, '2026-01-17', 3100.00);
INSERT INTO pagamentos VALUES (5002, 1002, '2026-01-16', 4200.00);
INSERT INTO pagamentos VALUES (5003, 1003, '2026-01-30', 780.00);
INSERT INTO pagamentos VALUES (5004, 1004, '2026-01-31', 3050.75);
INSERT INTO pagamentos VALUES (5005, 1005, '2026-01-20', 2750.50);
INSERT INTO pagamentos VALUES (5006, 1006, '2026-02-13', 350.00);
INSERT INTO pagamentos VALUES (5007, 1008, '2026-01-25', 2300.00);
INSERT INTO pagamentos VALUES (5008, 1009, '2026-01-29', 780.50);
INSERT INTO pagamentos VALUES (5009, 1009, '2026-01-30', 780.50);
INSERT INTO pagamentos VALUES (5010, 1010, '2026-02-01', 350.00);
INSERT INTO pagamentos VALUES (5011, 1011, '2026-02-19', 1300.00);
INSERT INTO pagamentos VALUES (5012, 1012, '2026-02-06', 780.00);
INSERT INTO pagamentos VALUES (5013, 1013, '2026-02-28', 480.50);
INSERT INTO pagamentos VALUES (5014, 1014, '2026-02-26', 1200.00);
INSERT INTO pagamentos VALUES (5015, 1016, '2026-02-22', 2300.00);
INSERT INTO pagamentos VALUES (5016, 1017, '2026-03-02', 480.90);
INSERT INTO pagamentos VALUES (5017, 1018, '2026-02-15', 3100.90);
INSERT INTO pagamentos VALUES (5018, 1019, '2026-02-27', 2712.50);
INSERT INTO pagamentos VALUES (5019, 1020, '2026-03-01', 350.75);
INSERT INTO pagamentos VALUES (5020, 1021, '2026-03-10', 950.00);
INSERT INTO pagamentos VALUES (5021, 1023, '2026-03-09', 1850.75);
INSERT INTO pagamentos VALUES (5022, 1024, '2026-03-13', 620.00);
INSERT INTO pagamentos VALUES (5023, 1025, '2026-03-07', 780.75);
INSERT INTO pagamentos VALUES (5024, 1025, '2026-03-08', 780.75);
INSERT INTO pagamentos VALUES (5025, 1026, '2026-03-18', 4200.75);
INSERT INTO pagamentos VALUES (5026, 1027, '2026-03-03', 2737.95);
INSERT INTO pagamentos VALUES (5027, 1028, '2026-03-26', 2300.75);
INSERT INTO pagamentos VALUES (5028, 1029, '2026-03-30', 620.50);
INSERT INTO pagamentos VALUES (5029, 1030, '2026-03-12', 950.75);
INSERT INTO pagamentos VALUES (5030, 1032, '2026-04-03', 780.00);
INSERT INTO pagamentos VALUES (5031, 1033, '2026-04-01', 1500.00);
INSERT INTO pagamentos VALUES (5032, 1034, '2026-04-10', 780.90);
INSERT INTO pagamentos VALUES (5033, 1035, '2026-03-27', 780.75);
INSERT INTO pagamentos VALUES (5034, 1037, '2026-04-16', 620.00);
INSERT INTO pagamentos VALUES (5035, 1038, '2026-04-14', 780.75);
INSERT INTO pagamentos VALUES (5036, 1040, '2026-04-08', 2750.50);
INSERT INTO pagamentos VALUES (5037, 1041, '2026-03-20', 890.00);
INSERT INTO pagamentos VALUES (5038, 1099, '2026-03-25', 1320.00);

