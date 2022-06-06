SELECT d.id, FORMAT(d.media,2) AS media
FROM (SELECT departamento AS id
           , avg(salario) AS media
      FROM professores
      GROUP BY departamento) AS d
WHERE d.media > 3000;