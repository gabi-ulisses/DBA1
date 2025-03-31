-- Agenda de Contatos --

DROP DATABASE IF EXISTS mercado; 
CREATE DATABASE mercado;
USE mercado;

DROP TABLE IF EXISTS Produtos; 
CREATE TABLE Produtos(
	id_produto int,
	descricao char(20),
	preco float default 9.99
);

INSERT INTO Produtos(id_produto, descricao, preco) 
VALUES (45, 'qquer', 32);

INSERT INTO Produtos (id_produto, descricao) 
VALUES (45, 'qquer');
    

    
