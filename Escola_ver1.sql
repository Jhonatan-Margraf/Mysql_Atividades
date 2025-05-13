create database escola1;
use escola1;

create table turma(
id_turma int primary key,
nome varchar(50),
ano varchar(50),
turno varchar(50)
);

create table professor(
id_professor int primary key,
nome varchar(200),
cpf varchar(11),
formacao varchar(200)
);

create table aluno(
id_aluno int primary key,
nome varchar(200),
id_turma int,
foreign key(id_turma) references turma(id_turma)
);

create table aula(
id_aula int primary key,
dia date,
id_professor int,
id_turma int,
foreign key(id_professor) references professor(id_professor),
foreign key(id_turma) references turma(id_turma) 
);

create table professor_turma(
id_professor int,
id_turma int,
primary key(id_professor, id_turma),
foreign key(id_professor) references professor(id_professor),
foreign key(id_turma) references turma(id_turma) 
);

create table aluno_aula(
id_aluno int,
id_aula int,
primary key(id_aluno, id_aula),
foreign key(id_aluno) references aluno(id_aluno),
foreign key(id_aula) references aula(id_aula) 
);

insert into professor (id_professor, nome, cpf, formacao) values (1, 'carlos silva', '12345678901', 'matemática');
insert into professor (id_professor, nome, cpf, formacao) values (2, 'fernanda souza', '98765432100', 'física');

update professor set formacao = 'engenharia matemática' where id_professor = 1;

delete from professor where id_professor = 2;


insert into turma (id_turma, nome, ano, turno) values (1, '1ºa', '2025', 'manhã');
insert into turma (id_turma, nome, ano, turno) values (2, '2ºb', '2025', 'tarde');

update turma set turno = 'integral' where id_turma = 1;

delete from turma where id_turma = 2;


insert into aluno (id_aluno, nome, id_turma) values (1, 'joão pedro', 1);
insert into aluno (id_aluno, nome, id_turma) values (2, 'ana beatriz', 1);

update aluno set nome = 'joão pedro da silva' where id_aluno = 1;

delete from aluno where id_aluno = 2;


insert into aula (id_aula, dia, id_professor, id_turma) values (1, '2025-05-13', 1, 1);
insert into aula (id_aula, dia, id_professor, id_turma) values (2, '2025-05-14', 1, 1);

update aula set dia = '2025-05-15' where id_aula = 2;

delete from aula where id_aula = 2;


insert into aluno_aula (id_aluno, id_aula) values (1, 1);
insert into aluno_aula (id_aluno, id_aula) values (2, 1);

delete from aluno_aula where id_aluno = 2 and id_aula = 1;
insert into aluno_aula (id_aluno, id_aula) values (2, 2);

delete from aluno_aula where id_aluno = 2 and id_aula = 2;


insert into professor_turma (id_professor, id_turma) values (1, 1);
insert into professor_turma (id_professor, id_turma) values (2, 1);

delete from professor_turma where id_professor = 2 and id_turma = 1;
insert into professor_turma (id_professor, id_turma) values (2, 2);

delete from professor_turma where id_professor = 2 and id_turma = 2;
