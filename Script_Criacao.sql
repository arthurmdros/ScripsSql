CREATE DATABASE empresa;
USE empresa;

DROP TABLE IF EXISTS empregado CASCADE;
DROP TABLE IF EXISTS departamento CASCADE;
DROP TABLE IF EXISTS projeto CASCADE;
DROP TABLE IF EXISTS alocacao CASCADE;
DROP TABLE IF EXISTS dependente CASCADE;

CREATE TABLE empregado(
	matricula int not null,
    nome varchar(45) not null,
    endereco varchar(70) not null,
    salario double not null,
    supervisor int not null,
    depto int not null,
    primary key(matricula)
);

CREATE TABLE departamento(
	codigo int not null,
    nome varchar(45) not null,
    gerente int not null,
    dataini date,
    primary key(codigo)
);

CREATE TABLE projeto(
	codigo int not null,
    nome varchar(45) not null,
    local varchar(45) not null,
    depart int not null,
    primary key(codigo)
);

CREATE TABLE alocacao(
	matric int not null,
    codigop int not null,
    horas int not null,
    primary key(matric,codigop)
);

CREATE TABLE dependente(
	codigo int not null,
    matricula int not null,
    nome varchar(45) not null,
    sexo varchar(2) not null,
    primary key(codigo)
);    

ALTER TABLE empregado
ADD FOREIGN KEY(supervisor)
REFERENCES projeto(codigo);

ALTER TABLE empregado
ADD FOREIGN KEY(depto)
REFERENCES departamento(codigo);

ALTER TABLE projeto
ADD FOREIGN KEY(depart)
REFERENCES departamento(codigo);

ALTER TABLE departamento
ADD FOREIGN KEY(gerente)
REFERENCES dependente(codigo);
