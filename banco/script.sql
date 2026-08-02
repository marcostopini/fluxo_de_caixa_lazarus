
create database fluxo_caixa;

create table contas(
 id_conta integer not null primary key,
 descricao varchar(80) not null unique,
 banco varchar(20),
 agencia varchar(15),
 conta varchar(15)
);

create table planos(
 id_plano integer not null primary key,
 descricao varchar(80) not null unique,
 tipo char(1)
);



create table lancamentos(
 conta integer not null,
 id_lcto integer not null,
 data_mvto date not null,
 plano integer not null,
 historico varchar(80),
 valor numeric(15,2),
 primary key(conta,id_lcto)
);
