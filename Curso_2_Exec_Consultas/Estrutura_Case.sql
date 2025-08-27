SELECT id_colaborador, cargo, salario,
CASE 
WHEN Salario < 3000 THEN 'Baixo'
WHEN Salario BETWEEN 3000 AND 6000 THEN 'Médio'
ELSE 'Alto'
END AS categoria_salario
FROM HistoricoEmprego
ORDER BY salario DESC;