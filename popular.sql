-- Destrói, recria e usa o banco de dados da aula
DROP DATABASE IF EXISTS aulasubquery;
CREATE DATABASE aulasubquery;
USE aulasubquery;

-- Cria as tabelas
CREATE TABLE departamentos (
    id          INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome        VARCHAR(30) NOT NULL UNIQUE,
    predio      VARCHAR(30) NOT NULL,
    orcamento   DECIMAL(10,2)
);

CREATE TABLE professores (
    id              INT NOT NULL PRIMARY KEY,
    nome            VARCHAR(50) NOT NULL,
    departamento    INT NOT NULL,
    salario         DECIMAL(10,2),
    cidade          VARCHAR(30),
    FOREIGN KEY (departamento) REFERENCES departamentos(id)
);

CREATE TABLE disciplinas (
    id      VARCHAR(30) NOT NULL PRIMARY KEY,
    nome    VARCHAR(30) NOT NULL UNIQUE,
    curso   VARCHAR(30) NOT NULL
);

CREATE TABLE ofertas (
    id          INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    disciplina  VARCHAR(30) NOT NULL,
    professor   INT NOT NULL,
    semestre    INT NOT NULL,
    ano         YEAR NOT NULL,
    FOREIGN KEY (disciplina) REFERENCES disciplinas(id),
    FOREIGN KEY (professor) REFERENCES professores(id)
);

CREATE TABLE alunos (
    matricula   INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome        VARCHAR(100) NOT NULL,
    endereco    VARCHAR(200) NOT NULL,
    telefone    VARCHAR(11) NOT NULL,
    nascimento  DATE NOT NULL
) AUTO_INCREMENT = 1000;

CREATE TABLE cursadas (
    id   INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    aluno       INT NOT NULL,
    disciplina  VARCHAR(30) NOT NULL,
    semestre    INT NOT NULL,
    ano         YEAR NOT NULL,
    nota        VARCHAR(1) NOT NULL,
    FOREIGN KEY (aluno) REFERENCES alunos(matricula),
    FOREIGN KEY (disciplina) REFERENCES disciplinas(id)
);

CREATE TABLE materiais(
    id          INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricao   VARCHAR(100) NOT NULL
) AUTO_INCREMENT = 1000;

CREATE TABLE compras(
    id          INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    professor   INT NOT NULL,
    material    INT NOT NULL,
    preco       DECIMAL(10,2) NOT NULL,
    qtd         INT NOT NULL,
    data_compra DATE NOT NULL,
    FOREIGN KEY (professor) REFERENCES professores(id),
    FOREIGN KEY (material) REFERENCES materiais(id)
) AUTO_INCREMENT = 1000;

-- Popula a tabela departamentos
INSERT INTO departamentos (nome, predio, orcamento) VALUES
ROW('Informática', 'Setor 1', 1000000),
ROW('Finanças', 'Setor 2', 3000000),
ROW('História', 'Setor 1', 2000000);

-- Popula a tabela professores
INSERT INTO professores VALUES
ROW(1000, 'Pedro Dias', 1, 2500, 'Porto Alegre'),
ROW(1001, 'João dos Santos', 2, 3500, 'Canoas'),
ROW(1002, 'Maria Silva', 3, 5500, 'Guaíba'),
ROW(1003, 'Luiza Meireles', 1, 1800, 'Gramado'),
ROW(1004, 'Wu Zen', 3, 4300, 'Dois Irmãos'),
ROW(1005, 'Ana Luz', 2, 5300, 'Canela');

-- Popula a tabela disciplinas
INSERT INTO disciplinas VALUES
ROW('INF01', 'banco de dados I', 'Técnico em Informática'),
ROW('INF02', 'banco de dados II', 'Técnico em Informática'),
ROW('FIN01', 'finanças básico', 'Técnico em Finanças'),
ROW('FIN02', 'finanças avançado', 'Técnico em Finanças'),
ROW('HIS01', 'história antiga', 'História'),
ROW('HIS02', 'história da arte', 'Técnico em Informática'),
ROW('INF03', 'teste de software', 'Técnico em Informática');

-- Popula a tabela ofertas
INSERT INTO ofertas (disciplina, professor, semestre, ano) VALUES
ROW('INF01', 1000, 1, '2020'),
ROW('INF01', 1000, 2, '2021'),
ROW('INF01', 1003, 2, '2021'),
ROW('INF01', 1000, 1, '2019'),
ROW('INF01', 1000, 2, '2019'),
ROW('INF02', 1003, 1, '2021'),
ROW('INF02', 1003, 1, '2022'),
ROW('FIN01', 1001, 2, '2019'),
ROW('FIN02', 1001, 2, '2021'),
ROW('FIN02', 1001, 1, '2021'),
ROW('HIS01', 1005, 2, '2019'),
ROW('HIS01', 1005, 2, '2021'),
ROW('HIS01', 1005, 1, '2020'),
ROW('INF03', 1003, 1, '2021'),
ROW('INF03', 1000, 1, '2019'),
ROW('HIS01', 1002, 1, '2020'),
ROW('HIS02', 1002, 2, '2021');

-- Popula a tabela alunos
INSERT INTO alunos (nome, endereco, telefone, nascimento) VALUES
ROW('Julia de Lima', 'Rua Mostardeiro, 500. Porto Alegre.', '51987564123', DATE('1995-05-14')),
ROW('Lucas Santos', 'Avenida das Hortências. Gramado.', '54123456789', DATE('2001-12-01')),
ROW('Greice Kelly Silva', 'Rua 1. Canoas.', '51234567123', DATE('1998-02-25')),
ROW('Cláudio Soares', 'Av. vinte de setembro, 234. Guaíba.', '51987987987', DATE('2002-01-27'));

-- Popula a tabela cursadas
INSERT INTO cursadas (aluno, disciplina, semestre, ano, nota) VALUES
ROW(1000, 'INF01', 1, '2019', 'A'),
ROW(1001, 'INF01', 1, '2019', 'D'),
ROW(1002, 'INF01', 1, '2019', 'C'),
ROW(1003, 'INF01', 1, '2019', 'E'),
ROW(1000, 'FIN01', 2, '2019', 'A'),
ROW(1000, 'HIS01', 1, '2020', 'B'),
ROW(1001, 'INF01', 1, '2020', 'A'),
ROW(1003, 'INF01', 1, '2020', 'B'),
ROW(1003, 'INF02', 2, '2021', 'C'),
ROW(1003, 'INF03', 1, '2019', 'C'),
ROW(1000, 'FIN02', 1, '2021', 'D'),
ROW(1000, 'FIN02', 2, '2021', 'A');

-- Popula a tabela materiais
INSERT INTO materiais(descricao) VALUES
ROW('caneta esferográfica'),
ROW('lápis'),
ROW('marca texto'),
ROW('caneta para quadro branco'),
ROW('folha A4'),
ROW('caderno');

-- Popula a tabela compras
INSERT INTO compras(professor, material, preco, qtd, data_compra) VALUES
ROW(1000, 1000, 1.2, 10, DATE('2019-01-12')),
ROW(1002, 1000, 1.2, 5, DATE('2019-05-24')),
ROW(1003, 1000, 1.2, 2, DATE('2019-12-08')),
ROW(1004, 1000, 1.2, 12, DATE('2019-04-15')),
ROW(1005, 1001, 2.0, 2, DATE('2019-10-07')),
ROW(1003, 1001, 1.5, 10, DATE('2019-12-08')),
ROW(1004, 1001, 1.8, 1, DATE('2019-04-15')),
ROW(1005, 1001, 3.0, 4, DATE('2019-10-07')),
ROW(1000, 1002, 1.45, 10, DATE('2020-01-12')),
ROW(1002, 1002, 2.16, 5, DATE('2020-01-12')),
ROW(1003, 1002, 4.29, 2, DATE('2020-01-12')),
ROW(1004, 1002, 5.0, 12, DATE('2020-01-12')),
ROW(1000, 1003, 2.2, 5, DATE('2019-01-12')),
ROW(1002, 1003, 3.2, 4, DATE('2019-05-24')),
ROW(1003, 1003, 0.2, 2, DATE('2019-12-08')),
ROW(1004, 1003, 1.0, 1, DATE('2019-04-15')),
ROW(1005, 1003, 2.23, 8, DATE('2019-10-07')),
ROW(1004, 1003, 30.0, 10, DATE('2020-06-18')),
ROW(1005, 1004, 10.0, 8, DATE('2020-08-27'));
