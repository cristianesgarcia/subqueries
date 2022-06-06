SELECT nome, departamento
FROM professores
WHERE salario > ALL (SELECT salario
                     FROM  professores
                     WHERE departamento = 2);