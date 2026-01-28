/* 
  Daily Active Users (DAU) Report
  This query calculates the number of unique active users per day.
*/
SELECT substr(DtCriacao, 0, 11) AS DtDia, 
        count(DISTINCT IdCliente) AS DAU
FROM transacoes
GROUP BY 1
ORDER BY DtDia;