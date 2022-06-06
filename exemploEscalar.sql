SELECT (SELECT COUNT(*) FROM ofertas)
        /
        (SELECT COUNT(*) FROM professores) AS valor;