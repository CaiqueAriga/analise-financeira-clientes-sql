SELECT c.nome,
       c.estado,
       COUNT(*) AS quantidade_transacoes,
       SUM(t.valor_final) AS total_gasto,
       AVG(t.valor_final) AS ticket_medio
FROM clientes c
JOIN transacoes t
ON c.id = t.cliente_id
WHERE t.status = 'Concluída'
GROUP BY c.nome, c.estado
HAVING COUNT(*) >= 3
ORDER BY total_gasto DESC;