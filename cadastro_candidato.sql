# Criação do banco de dados.
create database if not exists cadastro_reserva;

# Mostrar bancos existentes.
show databases;

# Usar o banco 'cadastro_reserva'.
use cadastro_reserva;

# mostrar tabelas no banco.
show tables;

# Consulta simples nas tabelas existentes.
select * from candidato;
select * from concorre;
select * from vaga;

# Criar tablea.
create table candidato (
id_cand int not null auto_increment primary key,
cpf varchar (20) not null,
nome varchar (50) not null,
tel varchar (20) not null)
default charset utf8;

# Inserir dados na tabela criada.
insert into candidato values 
(default, '330.3313.328-28', 'Isaias Santana dos Santos', '12 98104-5791');

# Excluir coluna da tabela.
alter table candidato drop column foto;

# Consulta simples a tabela.
select * from candidato;

# Criar tabela 'vaga'.
create table vaga (
id_vg int auto_increment not null primary key,
titulo_vaga varchar (50) not null,
data_cad date not null,
escolaridade varchar (30) not null,
requisitos text not null,
salario decimal(6,2) not null,
foto blob not null,
cv_pdf blob not null)
default charset utf8;

# Alterar tabela 'vaga' excluindo coluna
alter table  vaga drop column foto;
alter table vaga drop column cv_pdf;

# Inserino dados na tabela.
insert into vaga values
(default, 'Desenvolvedor Backend Jr.', 20210115, 'Superior', 'Programação orientada a objetos
Domínio em pelo menos uma linguagem de programação (Python, Ruby ou Java)
Frameworks',3000.00);

# Consulta simples na tabela.
select * from vaga;

# Criando tabela 'concorre'.
create table concorre (
id int not null auto_increment primary key,
data_insc date not null,
vg_id int not null,
cand_id int not null,
constraint fk_id_vg foreign key (vg_id)  references vaga (id_vg),
constraint fk_id_cand foreign key (cand_id) references candidato (id_cand))
default charset utf8;

# Alterando tabela 'concorre' adicionando uma coluna.
alter table concorre add column cv_pdf blob after id;

# Alterando tabela 'concorre' apagando uma coluna
alter table concorre drop column cv_pdf;

# Consulta simples.
select * from candidato;

# Inserino dados na tabeça 'concorre'.
insert into concorre values 
(default, 20210204, 1, 1);

# Consulta simples.
select * from concorre;

# Alterarndo tipo de dado da coluna e nome coluna.
alter table  concorre modify column cv_pdf blob not null after data_insc;

# Mostrando tabelas existentes.
show tables;

# Consultando várias tabelas usando o comando 'join'.
select candidato.nome , candidato.cpf, candidato.tel, vaga.titulo_vaga, vaga.salario, concorre.data_insc from candidato
right join vaga 
on vaga.id_vg = candidato.id_cand
left join concorre  
on concorre.id = vaga.id_vg
order by candidato.nome;

# Consultando duas tabelas usando o comando 'join'.
select cd.nome, v.titulo_vaga from candidato as cd
join vaga as v
on cd.id_cand= v.id_vg
order by cd.nome;
 
# Consultando várias tabelas usando o comando 'join'.
select cc.cand_id, cd.id_cand, cd.nome, cd.tel, cc.data_insc, v.titulo_vaga, v.data_cad, v.salario 
from candidato cd 
right join concorre cc
on cd.id_cand = cc.id
right join vaga v
on v.id_vg = cc.id
order by cd.nome;

####################################
# Consultando várias tabelas usando o comando 'join' e 'union'.
select candidato.nome, vaga.titulo_vaga, concorre.data_insc from
candidato 
left join concorre
on candidato.id_cand = concorre.id
union
select candidato.nome, vaga.titulo_vaga, concorre.data_insc from
candidato 
right join concorre
on candidato.id_cand = concorre.id;


### ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓  ###
# Consultando várias tabelas usando o comando 'join' e 'union'.
select nome, cpf
from candidato cd 
union
select id 'Número vaga', data_insc 'Dada Inscrição'
from concorre
union
select titulo_vaga 'Vaga', salario 'Salario'
from vaga;
###  ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑   ###

# Consultando várias tabelas usando o comando 'union' com a clausura 'where'.
select titulo_vaga 'Vaga', escolaridade 'Nivél',
salario + 450  'R$ 450 de premio'
from vaga
where salario <= 2500.00
union
select titulo_vaga 'Vaga', escolaridade 'Nivel',
salario - 450 'R$ Desconto'
from vaga
where salario >= 3000.00;

# Consulta simples
select * from candidato;

# Consultando várias tabelas usando o comando 'join'.
select cd.nome 'Nome completo', cd.cpf CPF, cc.data_insc 'Dada inscricao', vg.titulo_vaga vaga, vg.escolaridade nivel,
vg.salario  from candidato cd
join concorre cc
on cd.id_cand = cc.id
right join vaga vg
on vg.id_vg = cc.id;












