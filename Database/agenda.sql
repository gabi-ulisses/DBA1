-- Agenda de Contatos --

DROP DATABASE IF EXISTS agenda; 
CREATE DATABASE agenda;
USE agenda;

DROP TABLE IF EXISTS Contatos; 
CREATE TABLE Contatos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30),
    tel VARCHAR(14), 
    idCidade INT
);

DROP TABLE IF EXISTS Cidade; 
CREATE TABLE Cidade(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30)
);


    
