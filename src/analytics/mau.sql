/* 
  Monthly Active Users (MAU) Report
  This query calculates the number of unique active users per month.
*/

WITH tb_daily AS (

    SELECT DISTINCT
        date(substr(DtCriacao, 1, 11)) AS DtDia,
        IdCliente

    FROM transacoes
    ORDER BY DtDia

),

tb_distinct_days AS (

    SELECT
        DISTINCT DtDia AS dtRef
    FROM tb_daily

)

SELECT t1.dtRef,
        COUNT(DISTINCT IdCliente) AS MAU,
        COUNT(DISTINCT t2.DtDia) AS qtdeDias
FROM tb_distinct_days AS t1

LEFT JOIN tb_daily AS t2
ON t2.DtDia <= t1.dtRef
AND julianday(t1.dtRef) - julianday(t2.DtDia) < 28

GROUP BY t1.dtRef

ORDER BY t1.dtRef asc