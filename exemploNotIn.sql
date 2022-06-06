SELECT DISTINCT disciplina
FROM ofertas
WHERE semestre = 2
AND ano = 2021
AND disciplina NOT IN (SELECT disciplina
                       FROM ofertas
                       WHERE semestre = 1
                       AND ano = 2020);