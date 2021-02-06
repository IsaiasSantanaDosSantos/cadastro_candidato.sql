###  COMANDOS DDL   ###
		#Criar banco de dados
CREATE  DATABASE IF NOT EXISTS fazenda_bd;   
		#Usar banco de dados  
USE fazenda_bd;                                
        #Criando uma tabela
CREATE TABLE teste (                           
nome varchar(20) NOT NULL,
valor decimal(6,2) NOT NULL,
tipo varchar(30) NOT NULL);
		#Apagar tabela criada
DROP TABLE teste;                              
        #Criando uma tabela
CREATE TABLE funcionarios (                    
    nome varchar(50) NOT NULL,
    cpf varchar(15) NOT NULL,
    salario decimal(10,2),
    setor varchar(30),
    id int(3) PRIMARY KEY AUTO_INCREMENT);

SHOW TABLES;  #Comando para mostrar tabelas existentes no banco

CREATE TABLE producao_leite (
    id int(3) PRIMARY KEY AUTO_INCREMENT,
    especie varchar(20),
    ultima_ordenha date,
    temperatura_leite decimal(5,2),
    produt_quarto decimal(6,3),
    inseminacao bool,
    fk_produtos_id int(3),
    fk_funcionarios_id int(3));

CREATE TABLE produtos (
    id int(3) PRIMARY KEY AUTO_INCREMENT,
    nome varchar(50),
    tipo varchar(30),
    qtde_estoque decimal(10,3),
    preco decimal(10,2),
    validade date
);

CREATE TABLE equipamentos (
    id int(3) PRIMARY KEY AUTO_INCREMENT,
    nome varchar(50),
    tipo varchar(30),
    setor varchar(30)
);

CREATE TABLE varejistas (
    id int(3) PRIMARY KEY AUTO_INCREMENT,
    nome_empresa varchar(50),
    nome_comprador varchar(50),
    telefone varchar(15),
    qtde_comprada decimal(10,3),
    preco decimal(10,2)
);

CREATE TABLE compra (
    fk_varejistas_id int(3),
    fk_produtos_id int(3)
);

CREATE TABLE produz (
    fk_equipamentos_id int(3),
    fk_produtos_id int(3));
    
             #Comandos para criar chaves estrangeiras nas tabelas
ALTER TABLE producao_leite ADD CONSTRAINT FK_producao_leite_1
    FOREIGN KEY (fk_produtos_id)
    REFERENCES produtos (id)
    ON DELETE RESTRICT;
 
ALTER TABLE producao_leite ADD CONSTRAINT FK_producao_leite_3
    FOREIGN KEY (fk_funcionarios_id)
    REFERENCES funcionarios (id);
 
ALTER TABLE compra ADD CONSTRAINT FK_compra_1
    FOREIGN KEY (fk_varejistas_id)
    REFERENCES varejistas (id)
    ON DELETE RESTRICT;
    
    DESCRIBE producao_leite; #Comando para exibir a tabela e os tipos de dados das colunas
 
ALTER TABLE compra ADD CONSTRAINT FK_compra_2
    FOREIGN KEY (fk_produtos_id)
    REFERENCES produtos (id)
    ON DELETE RESTRICT;
 
ALTER TABLE produz ADD CONSTRAINT FK_produz_1
    FOREIGN KEY (fk_equipamentos_id)
    REFERENCES equipamentos (id)
    ON DELETE RESTRICT;
 
ALTER TABLE produz ADD CONSTRAINT FK_produz_2
    FOREIGN KEY (fk_produtos_id)
    REFERENCES produtos (id)
    ON DELETE RESTRICT;
    
    
    SHOW TABLES;
    
    ###   COMANDOS DML   ###
	         
             #Inserindo dados nas tabeles
    INSERT INTO funcionarios (nome, cpf, salario, setor) VALUES
    ('Isaias Santana','123.456.789-01', 1789.89,'produção leite');
    
    INSERT INTO varejistas ( nome_empresa, nome_comprador, telefone, qtde_comprada, preco) VALUES   #Inserir dados na tabela
    ('Cooperativa Brothers','Josué Silva','(12)98745-5441',158.500, 2.58);
    
    SELECT * FROM varejistas;
            
    INSERT INTO produtos (nome, tipo, qtde_estoque, preco,validade) VALUES    
    ('leite','vaca',258.458, 2.48, '20201120');
    
    INSERT INTO produz (fk_equipamentos_id, fk_produtos_id) VALUES    
    (1,4),(2,5),(5,1);
    
    INSERT INTO equipamentos (nome, tipo, setor) VALUES  
    ('semeadora','manual','plantio'),
    ('colhedeira','manual','plantio');
    
    INSERT INTO compra (fk_varejistas_id, fk_produtos_id) VALUES   
    (3,4),(2,1);
			
            #Consultar dados inseridos na tabela
    SELECT * FROM funcionarios;   
            
	SELECT * FROM equipamentos; 
    
	SELECT * FROM produz; 	   
           
	SELECT * FROM produtos; 
           
    SELECT * FROM producao_leite;        
       
     SELECT * FROM compra;
     
     SELECT * FROM varejistas;
     
     
     #Coamandos para consultas de junções
    SELECT prod.nome, prod.qtde_estoque, prod.validade from produtos as prod;
    
    SELECT vare.nome_empresa, vare.nome_comprador, prod.nome_produto, vare.qtde_comprada, func.nome_func
    from varejistas as vare 
    left join produtos as prod
    on vare.id = prod.id
	left join funcionarios as func
    on func.id = prod.id
    order by prod.nome_produto;
    
     #Consultas de junção de agregação
    SELECT sum(qtde_estoque) FROM produtos;  #Soma a quantidade total em estoque
    
    SELECT avg(qtde_estoque) FROM produtos;   #faz a média de quantidade em estoque
    
    SELECT count(*) FROM produtos;  #Conta quantas linhas/tuplas tem a tabela produtos
     
    #Comando para deletar uma linha/tupla da coluna
    DELETE FROM produtos   
WHERE id = 3;

#Comando para alterar um (ou mais se precisar separando por virgula) campos de uma linha/tupla
UPDATE produtos SET preco = 2.69 WHERE id = 1;   
            
	   
    
      
    
    
    
      
	
    
    
      
    