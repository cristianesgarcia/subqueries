SELECT d.nome AS Depto,
(SELECT COUNT(*)
 FROM professores AS p
 WHERE p.departamento = d.id) AS Num
FROM departamentos AS d;