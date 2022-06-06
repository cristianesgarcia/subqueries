SELECT nome, departamento
FROM professores
WHERE salario > SOME (SELECT salario
                      FROM  professores
                      WHERE departamento = 3);