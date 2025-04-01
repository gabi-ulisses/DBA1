-- Cantina IFSP --

DROP DATABASE IF EXISTS cantina; 
CREATE DATABASE cantina;
USE cantina;

DROP TABLE IF EXISTS Etiquetas; 
CREATE TABLE Etiquetas(
	id INT AUTO_INCREMENT,
	cor CHAR(20),
	preco FLOAT CHECK (preco > 0),
    PRIMARY KEY(id)
);

INSERT INTO Etiquetas (cor, preco) VALUES
('Vermelho', 10.00),
('Azul', 5.00),
('Amarelo', 6.00);

DROP TABLE IF EXISTS Tipos; 
CREATE TABLE Tipos(
	id INT AUTO_INCREMENT,
	tipo CHAR(20) UNIQUE NOT NULL,
	PRIMARY KEY(id)
);

INSERT INTO Tipos (tipo) VALUES
('Assado'),
('Frito'),
('Doce');

DROP TABLE IF EXISTS Tamanhos; 
CREATE TABLE Tamanhos(
	id INT AUTO_INCREMENT,
	tamanho CHAR(1),
    PRIMARY KEY(id)
);

INSERT INTO Tamanhos (tamanho) VALUES
('P'),
('M'),
('G');

DROP TABLE IF EXISTS Salgados; 
CREATE TABLE Salgados(
	id INT AUTO_INCREMENT,
	recheio VARCHAR(50),
	id_etiqueta INT NOT NULL,
    id_tamanho INT NOT NULL,
	id_tipo INT NOT NULL,
	PRIMARY KEY(id),
    FOREIGN KEY(id_etiqueta) REFERENCES Etiquetas(id),
	FOREIGN KEY(id_tamanho) REFERENCES Tamanhos(id),
    FOREIGN KEY(id_tipo) REFERENCES Tipos(id)
);

INSERT INTO Salgados (recheio, id_tamanho, id_tipo, id_etiqueta) VALUES
('Queijo', 1, 1, 1),
('Requeijão', 2, 2, 2),
('Presunto e Queijo', 3, 1, 3),
('Brócolis', 1, 1, 1),
('Chocolate', 2, 2, 2),
('Palmito', 2, 1, 3),
('Pizza', 2, 1, 1),
('Romeu e Julieta', 3, 3, 2),
('Cheedar', 1, 2, 1);

DROP TABLE IF EXISTS Bebidas; 
CREATE TABLE Bebidas(
	id INT AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
	PRIMARY KEY(id)
);

INSERT INTO Bebidas (nome) VALUES
('Água'),
('Refrigerante'),
('Suco de Laranja'),
('Suco de Uva'),
('Café'),
('Chá'),
('Energético');

DROP TABLE IF EXISTS Pagamentos; 
CREATE TABLE Pagamentos (
    id INT AUTO_INCREMENT,
    metodo VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO Pagamentos (metodo) VALUES
('Dinheiro'),
('Cartão de Crédito'),
('Cartão de Débito'),
('Pix');


DROP TABLE IF EXISTS Pedidos; 
CREATE TABLE Pedidos(
	id INT AUTO_INCREMENT,
	id_salgado INT NOT NULL,
    id_pagamento INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    total FLOAT CHECK (total > 0),
	PRIMARY KEY(id),
    FOREIGN KEY(id_salgado) REFERENCES Salgados(id),
    FOREIGN KEY(id_pagamento) REFERENCES Pagamentos(id)    
);
    
INSERT INTO Pedidos (id_salgado, id_pagamento, quantidade, total) VALUES
(1, 1, 2, 5.00),
(2, 2, 1, 3.00),
(3, 3, 3, 9.00);