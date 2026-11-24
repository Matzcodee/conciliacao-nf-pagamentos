# Conciliação de Notas Fiscais x Pagamentos (SQL + Excel)

Projeto prático de estudo: cruzar as **notas fiscais emitidas** com os **pagamentos recebidos**, identificar divergências e consolidar o resultado.
Os dados são **fictícios**, criados só para treinar.

## O problema

Uma empresa emite notas fiscais e recebe pagamentos. No fechamento, é preciso conferir se tudo bate e explicar as diferenças.

A conciliação procura 5 situações:

| Situação | Como é identificada |
|---|---|
| Conciliada | Um pagamento, com o mesmo valor da nota |
| Sem pagamento | Nota sem nenhum pagamento |
| Valor divergente | Valor pago diferente do valor da nota |
| Pagamento duplicado | Mais de um pagamento para a mesma nota |
| Pagamento sem nota | Pagamento de uma nota que não existe |

## Arquivos

| Arquivo | O que é |
|---|---|
| `01_criar_tabelas_e_dados.sql` | Cria as tabelas `notas` e `pagamentos` e insere os dados |
| `02_consultas_conciliacao.sql` | Consultas de conciliação (JOIN, GROUP BY, CASE WHEN, CTE) |
| `notas.csv` / `pagamentos.csv` | Os mesmos dados em CSV |
| `conciliacao.xlsx` | Conciliação em Excel (PROCV, SOMASES/SOMASE, CONT.SE, SE, formatação condicional) |

## Como executar o SQL

1. Abra um banco online, por exemplo o **SQLite Online** (sqliteonline.com) ou o **Oracle Live SQL**.
2. Rode o conteúdo de `01_criar_tabelas_e_dados.sql`.
3. Rode as consultas de `02_consultas_conciliacao.sql`, uma de cada vez.

O SQL usa comandos padrão (`LEFT JOIN`, `GROUP BY`, `HAVING`, `CASE WHEN`, `WITH`, `COALESCE`, `ROUND`), então roda nos dois bancos. As datas ficam em texto no formato `AAAA-MM-DD` para funcionar em ambos.

## O que cada consulta faz

1. **Visão geral:** total emitido x total pago.
2. **Notas sem pagamento:** `LEFT JOIN` + `IS NULL`.
3. **Pagamentos sem nota:** `LEFT JOIN` no sentido inverso.
4. **Pagamentos duplicados:** `GROUP BY` + `HAVING COUNT(*) > 1`.
5. **Valor diferente:** `INNER JOIN` comparando valor da nota e valor pago.
6. **Conciliação completa:** uma linha por nota, com status via `CASE WHEN`.
7. **Resumo por status:** consolidação com `GROUP BY`.

## Resultado esperado

- 40 notas emitidas (R$ 63.786,50) e 38 pagamentos (R$ 57.143,65)
- 28 notas conciliadas
- 4 com valor divergente
- 6 sem pagamento
- 2 com pagamento duplicado
- 2 pagamentos sem nota correspondente

SQL e Excel chegam aos mesmos números.

## Conclusões

- O `LEFT JOIN` com `IS NULL` é a forma mais direta de achar o que existe em uma tabela e não na outra.
- Consolidar os pagamentos por nota (`GROUP BY`) antes de comparar evita erro quando há pagamento duplicado.
- Comparar valores com `ROUND(..., 2)` evita diferença falsa por arredondamento.

## Próximos passos

- Tratar pagamentos parciais (uma nota paga em várias parcelas)
- Adicionar tolerância de centavos na comparação
- Criar um painel no Power BI com o resumo
