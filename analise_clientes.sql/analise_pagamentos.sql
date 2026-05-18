SELECT t.metodo_pagamento,
       COUNT(DISTINCT c.id) AS clientes_distintos,
       COUNT(*) AS quantidade_transacoes,
       SUM(t.valor_final) AS valor_total_movimentado,
       AVG(t.valor_final) AS ticket_medio
FROM clientes c
JOIN transacoes t
ON c.id = t.cliente_id
WHERE t.status = 'Concluída'
GROUP BY t.metodo_pagamento
ORDER BY valor_total_movimentado DESC;