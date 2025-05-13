CREATE DATABASE ESCOLA;
USE ESCOLA;

CREATE TABLE instrutores (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  valor_hora INTEGER UNSIGNED NULL,
  certificados VARCHAR(255) NULL,
  PRIMARY KEY(id)
);
CREATE TABLE cursos (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  requisito VARCHAR(255) NULL,
  carga_horaria SMALLINT UNSIGNED NULL,
  preco DOUBLE UNSIGNED NULL,
  PRIMARY KEY(id)
);
 
CREATE TABLE alunos (
  id INT NOT NULL AUTO_INCREMENT,
  cpf CHAR(11) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  fone CHAR(14) NOT NULL,
  data_nascimento DATE NULL,
  PRIMARY KEY(id)
);
 
CREATE TABLE turmas (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  instrutores_id INT NOT NULL,
  cursos_id INTEGER UNSIGNED NOT NULL,
  data_inicio DATE NULL,
  data_final DATE NULL,
  carga_horaria SMALLINT UNSIGNED NULL,
  PRIMARY KEY(id),
  INDEX turmas_FKIndex1(cursos_id),
  INDEX turmas_FKIndex2(instrutores_id),
  CONSTRAINT CURSO_TURMA_FK FOREIGN KEY(cursos_id)
    REFERENCES cursos(id),
  CONSTRAINT INSTRUTOR_TURMA_FK FOREIGN KEY(instrutores_id)
    REFERENCES instrutores(id)
);
 
CREATE TABLE matriculas (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  turmas_id INTEGER UNSIGNED NOT NULL,
  alunos_id INT NOT NULL,
  data_matricula DATE NULL,
  PRIMARY KEY(id),
   CONSTRAINT ALUNO_MATRICULA_FK FOREIGN KEY(alunos_id)
    REFERENCES alunos(id),
  CONSTRAINT TURMA_MATRICULA_FK FOREIGN KEY(turmas_id)
    REFERENCES turmas(id)
);


insert into instrutores (nome, email, valor_hora, certificados) values ('Carlos Silva', 'carlos@escola.com', 50, 'Certificado A');
insert into instrutores (nome, email, valor_hora, certificados) values ('Fernanda Souza', 'fernanda@escola.com', 55, 'Certificado B');
insert into instrutores (nome, email, valor_hora, certificados) values ('Ana Lima', 'ana@escola.com', 60, 'Certificado C');
insert into instrutores (nome, email, valor_hora, certificados) values ('Ricardo Oliveira', 'ricardo@escola.com', 65, 'Certificado D');
insert into instrutores (nome, email, valor_hora, certificados) values ('Mariana Costa', 'mariana@escola.com', 70, 'Certificado E');

insert into cursos (nome, requisito, carga_horaria, preco) values ('Matemática Básica', 'Nenhum', 60, 150.00);
insert into cursos (nome, requisito, carga_horaria, preco) values ('Física Avançada', 'Matemática Básica', 80, 200.00);
insert into cursos (nome, requisito, carga_horaria, preco) values ('Programação em Python', 'Nenhum', 40, 180.00);
insert into cursos (nome, requisito, carga_horaria, preco) values ('Química Geral', 'Física Avançada', 70, 220.00);
insert into cursos (nome, requisito, carga_horaria, preco) values ('Algoritmos e Estruturas de Dados', 'Programação em Python', 60, 250.00);

insert into alunos (cpf, nome, email, fone, data_nascimento) values ('12345678901', 'João Pedro', 'joao@escola.com', '11987654321', '2000-05-15');
insert into alunos (cpf, nome, email, fone, data_nascimento) values ('23456789012', 'Ana Beatriz', 'ana@escola.com', '11976543210', '1999-08-20');
insert into alunos (cpf, nome, email, fone, data_nascimento) values ('34567890123', 'Lucas Silva', 'lucas@escola.com', '11965432109', '1998-02-10');
insert into alunos (cpf, nome, email, fone, data_nascimento) values ('45678901234', 'Mariana Costa', 'mariana@escola.com', '11954321098', '2001-03-25');
insert into alunos (cpf, nome, email, fone, data_nascimento) values ('56789012345', 'Rafael Oliveira', 'rafael@escola.com', '11943210987', '2000-11-12');

insert into turmas (instrutores_id, cursos_id, data_inicio, data_final, carga_horaria) values (1, 1, '2025-06-01', '2025-08-01', 60);
insert into turmas (instrutores_id, cursos_id, data_inicio, data_final, carga_horaria) values (2, 2, '2025-06-01', '2025-09-01', 80);
insert into turmas (instrutores_id, cursos_id, data_inicio, data_final, carga_horaria) values (3, 3, '2025-06-01', '2025-07-01', 40);
insert into turmas (instrutores_id, cursos_id, data_inicio, data_final, carga_horaria) values (4, 4, '2025-06-01', '2025-09-01', 70);
insert into turmas (instrutores_id, cursos_id, data_inicio, data_final, carga_horaria) values (5, 5, '2025-06-01', '2025-08-01', 60);

insert into matriculas (turmas_id, alunos_id, data_matricula) values (1, 1, '2025-05-20');
insert into matriculas (turmas_id, alunos_id, data_matricula) values (2, 2, '2025-05-21');
insert into matriculas (turmas_id, alunos_id, data_matricula) values (3, 3, '2025-05-22');
insert into matriculas (turmas_id, alunos_id, data_matricula) values (4, 4, '2025-05-23');
insert into matriculas (turmas_id, alunos_id, data_matricula) values (5, 5, '2025-05-24');

update instrutores set nome = 'Carlos Alberto Silva' where id = 1;
update instrutores set email = 'fernanda.souza@escola.com' where nome = 'Fernanda Souza';

update cursos set nome = 'Matemática para Todos' where id = 1;
update cursos set preco = 210.00 where nome = 'Física Avançada';

update turmas set instrutores_id = 2 where id = 1;
update turmas set instrutores_id = 4 where id = 5;

delete from instrutores where id = 3;
delete from instrutores where id = 4;

delete from cursos where id = 3;
delete from cursos where id = 4;

delete from alunos where id = 4;
delete from alunos where id = 5;

delete from turmas where id = 2;
delete from turmas where id = 3;

delete from matriculas where id = 3;
delete from matriculas where id = 5;

select * from instrutores;
select * from cursos;
select * from alunos;
select * from turmas;
select * from matriculas;
