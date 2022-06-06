SELECT nome
FROM professores AS p
WHERE EXISTS (SELECT *
              FROM ofertas AS o
              WHERE o.professor = p.id
              AND o.ano = 2021
              AND o.semestre = 2);