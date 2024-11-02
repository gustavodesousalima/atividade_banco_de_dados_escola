Create database db_escola;
use db_escola;

create table tb_aluno(
	pk_id_aluno int auto_increment primary key,
    nome_aluno varchar(35),
    cpf_aluno char(11),
    genero enum('f', 'm', 'o'),
    email_aluno varchar(50),
    telefone_aluno varchar(13)
);

create table tb_professor (
    pk_id_professor int auto_increment primary key,
    nome_professor varchar(35),
    cidade varchar(45),
    cpf_professor char(11),
    genero enum('f', 'm', 'o'),
    telefone_professor varchar(13),
    disciplina VARCHAR(50)
);

create table tb_aula(
	pk_id_aula int auto_increment primary key,
    nome_aula varchar(35),
    horario datetime,
    ead boolean,
    descricao varchar(50),
    telefone_professor varchar(13)
);

insert into tb_aluno(
	nome_aluno,cpf_aluno,genero,email_aluno,telefone_aluno
) values 
('Luis de Sousa', '26397765890','m','luisdesousa@gmail.com','5511943234551'),
('Fernanda Lima', '35397765890','f','fernandalima@gmail.com','5511943234552'),
('Julia Lima', '67397765890','f','julialima@gmail.com','5511943234553'),
('Marcos Lima', '97397765890','m','marcoslima@gmail.com','5511943234554'),
('Patricia Lima', '87397765890','f','patricialima@gmail.com','5511943234555'),
('Cleiton Lima', '77397765890','m','cleitonlima@gmail.com','5511943234556'),
('Lais Lima', '17397765890','f','laislima@gmail.com','5511943234557'),
('Henrique Lima', '27397765890','m','henriquelima@gmail.com','5511943234558'),
('Rebeca Lima', '37397765890','f','rebecalima@gmail.com','5511943234559'),
('Sabrina Lima', '47397765890','f','sabrinalima@gmail.com','5511943234510');

insert into tb_professor (
    nome_professor, cidade, cpf_professor, genero, telefone_professor, disciplina
) values 
('Bruno de Sousa', 'São Paulo', '26397765890', 'm','551191234567', 'Matemática'),
('Fernanda Lima', 'Rio de Janeiro', '35397765890', 'f','551192345678', 'História'),
('Juliana Lima', 'Belo Horizonte', '67397765890', 'f','551193456789', 'Biologia'),
('Marcos Lima', 'Curitiba', '97397765890', 'm','551194567890', 'Química'),
('Patricia Lima', 'Porto Alegre', '87397765890', 'f','551195678901', 'Física'),
('Cleber Lima', 'Salvador', '77397765890', 'm','551196789012', 'Literatura'),
('Laisa Lima', 'Fortaleza', '17397765890', 'f','551197890123', 'Geografia'),
('David Lima', 'Recife', '27397765890', 'm','551198901234', 'Educação Física'),
('Rebeca Lima', 'Manaus', '37397765890', 'f','551199012345', 'Artes'),
('Sabrina Lima', 'Natal', '47397765890', 'f','551190123456', 'Filosofia');

insert into tb_aula (
    nome_aula, horario, ead, descricao, telefone_professor
) values 
('Matemática Avançada', '2024-11-05 10:00:00', TRUE, 'Aula sobre cálculo e álgebra', '5511991234567'),
('História Moderna', '2024-11-06 14:00:00', FALSE, 'Discussão sobre eventos importantes', '5511992345678'),
('Biologia Celular', '2024-11-07 09:00:00', TRUE, 'Estudo das células e seus componentes', '5511993456789'),
('Química Orgânica', '2024-11-08 11:00:00', FALSE, 'Introdução à química dos compostos orgânicos', '5511994567890'),
('Física Clássica', '2024-11-09 15:00:00', TRUE, 'Princípios da física clássica', '0551195678901'),
('Literatura Brasileira', '2024-11-10 16:00:00', FALSE, 'Análise de obras de autores brasileiros', '5511996789012'),
('Programação em Python', '2024-11-11 13:00:00', TRUE, 'Introdução à linguagem de programação Python', '5511997890123'),
('Arte Contemporânea', '2024-11-12 18:00:00', FALSE, 'Estudo sobre artistas e movimentos contemporâneos', '5511998901234'),
('Educação Financeira', '2024-11-13 17:00:00', TRUE, 'Conceitos básicos de finanças pessoais', '5511999012345'),
('Ética e Cidadania', '2024-11-14 19:00:00', FALSE, 'Reflexão sobre ética na sociedade', '5511990123456');


select * from tb_aluno;
select * from tb_professor;
select * from tb_aula;

start transaction;

ALTER TABLE tb_professor add column estado_civil varchar(25);
ALTER TABLE tb_professor add column nome_mae varchar(50);

alter table tb_professor change column cpf_professor cpf_professor varchar(12);

insert into tb_professor (
    nome_professor, cidade, cpf_professor, genero, telefone_professor, disciplina, estado_civil, nome_mae
) values 
('Bruno de Sousa', 'São Paulo', '26397765890', 'm','551191234567', 'Matemática', 'Solteiro', 'Francisca de Sousa'),
('Fernanda Lima', 'Rio de Janeiro', '35397765890', 'f','551192345678', 'História', 'Casada', 'Maria de Lima'),
('Juliana Lima', 'Belo Horizonte', '67397765890', 'f','551193456789', 'Biologia', 'Solteira', 'Ana Lima');

alter table tb_professor drop column cidade;

update tb_professor set disciplina = 'Matemática' where pk_id_professor in (12,13,14,15,16);

delete from tb_professor where pk_id_professor in (7,10,12);

alter table tb_professor add column email_professor varchar(50);

update tb_professor set email_professor = 'solicitação em andamento';

alter table tb_professor change column estado_civil estado_civil char(10);

alter table tb_professor add column formacao_prof varchar(50);

rollback;

commit;