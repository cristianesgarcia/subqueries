SELECT COUNT(DISTINCT aluno) AS "Quantidade"
FROM cursadas
WHERE (disciplina, semestre, ano)
   IN (SELECT disciplina, semestre, ano
       FROM ofertas
       WHERE professor = 1000);
