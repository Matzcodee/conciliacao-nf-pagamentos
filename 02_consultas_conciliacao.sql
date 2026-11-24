-- Projeto: Conciliacao de Notas Fiscais x Pagamentos
-- Passo 2: consultas de conciliacao. Rode uma de cada vez.

-- 1) Visao geral: quanto foi emitido x quanto foi pago
SELECT COUNT(*) AS qtd_notas, SUM(valor) AS total_emitido
FROM notas;

SELECT COUNT(*) AS qtd_pagamentos, SUM(valor_pago) AS total_pago
FROM pagamentos;

-- 2) Notas SEM pagamento (LEFT JOIN + IS NULL)
SELECT n.numero_nf, n.cliente, n.data_emissao, n.valor
FROM notas n
LEFT JOIN pagamentos p ON p.numero_nf = n.numero_nf
WHERE p.numero_nf IS NULL
ORDER BY n.numero_nf;

-- 3) Pagamentos SEM nota correspondente (LEFT JOIN no sentido inverso)
SELECT p.id_pagamento, p.numero_nf, p.data_pagamento, p.valor_pago
FROM pagamentos p
LEFT JOIN notas n ON n.numero_nf = p.numero_nf
WHERE n.numero_nf IS NULL
ORDER BY p.id_pagamento;

-- 4) Pagamentos DUPLICADOS (GROUP BY + HAVING)
SELECT numero_nf, COUNT(*) AS qtd_pagamentos, SUM(valor_pago) AS total_pago
FROM pagamentos
GROUP BY numero_nf
HAVING COUNT(*) > 1
ORDER BY numero_nf;

-- 5) Valor pago DIFERENTE do valor da nota (INNER JOIN)
SELECT n.numero_nf, n.cliente, n.valor AS valor_nota, p.valor_pago,
       ROUND(p.valor_pago - n.valor, 2) AS diferenca
FROM notas n
INNER JOIN pagamentos p ON p.numero_nf = n.numero_nf
WHERE ROUND(p.valor_pago, 2) <> ROUND(n.valor, 2)
ORDER BY n.numero_nf;

-- 6) CONCILIACAO COMPLETA: uma linha por nota, com o status
--    (consolida os pagamentos por nota e classifica com CASE WHEN)
WITH pag AS (
  SELECT numero_nf, COUNT(*) AS qtd_pagamentos, SUM(valor_pago) AS total_pago
  FROM pagamentos
  GROUP BY numero_nf
)
SELECT
  n.numero_nf,
  n.cliente,
  n.valor                                   AS valor_nota,
  COALESCE(p.total_pago, 0)                 AS total_pago,
  ROUND(COALESCE(p.total_pago, 0) - n.valor, 2) AS diferenca,
  CASE
    WHEN p.numero_nf IS NULL                              THEN 'SEM PAGAMENTO'
    WHEN p.qtd_pagamentos > 1                             THEN 'PAGAMENTO DUPLICADO'
    WHEN ROUND(p.total_pago, 2) <> ROUND(n.valor, 2)      THEN 'VALOR DIVERGENTE'
    ELSE 'CONCILIADA'
  END                                       AS status
FROM notas n
LEFT JOIN pag p ON p.numero_nf = n.numero_nf
ORDER BY n.numero_nf;

-- 7) RESUMO por status (consolidacao com GROUP BY)
WITH pag AS (
  SELECT numero_nf, COUNT(*) AS qtd_pagamentos, SUM(valor_pago) AS total_pago
  FROM pagamentos
  GROUP BY numero_nf
),
conc AS (
  SELECT
    n.numero_nf,
    n.valor AS valor_nota,
    COALESCE(p.total_pago, 0) AS total_pago,
    CASE
      WHEN p.numero_nf IS NULL                         THEN 'SEM PAGAMENTO'
      WHEN p.qtd_pagamentos > 1                        THEN 'PAGAMENTO DUPLICADO'
      WHEN ROUND(p.total_pago, 2) <> ROUND(n.valor, 2) THEN 'VALOR DIVERGENTE'
      ELSE 'CONCILIADA'
    END AS status
  FROM notas n
  LEFT JOIN pag p ON p.numero_nf = n.numero_nf
)
SELECT status,
       COUNT(*)                         AS qtd_notas,
       ROUND(SUM(valor_nota), 2)         AS total_notas,
       ROUND(SUM(total_pago), 2)          AS total_pago,
       ROUND(SUM(total_pago) - SUM(valor_nota), 2) AS diferenca
FROM conc
GROUP BY status
ORDER BY status;
