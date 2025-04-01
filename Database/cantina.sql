-- Cantina IFSP --

DROP DATABASE IF EXISTS cantina; 
CREATE DATABASE cantina;
USE cantina;

DROP TABLE IF EXISTS Etiquetas; 
CREATE TABLE Etiquetas(
	cor CHAR(20) UNIQUE NOT NULL,
	preco FLOAT CHECK (preco > 0)
);

INSERT INTO Etiquetas (cor, preco) VALUES
('Vermelho', 10.00),
('Azul', 5.00),
('Amarelo', 6.00);

-- TESTES:

INSERT INTO Etiquetas (cor, preco) VALUES ('Vermelho', 4.00);
INSERT INTO Etiquetas (cor, preco) VALUES ('Verde', -4.00);


DROP TABLE IF EXISTS Tipos; 
CREATE TABLE Tipos(
	id_tipo INT AUTO_INCREMENT PRIMARY KEY,
	tipo CHAR(20) UNIQUE NOT NULL
);

INSERT INTO Tipos (tipo) VALUES
('Assado'),
('Frito'),
('Doce');

DROP TABLE IF EXISTS Tamanhos; 
CREATE TABLE Tamanhos(
	id_tamanho INT AUTO_INCREMENT PRIMARY KEY,
	tamanho CHAR(1) UNIQUE NOT NULL
);

INSERT INTO Tamanhos (tamanho) VALUES
('P'),
('M'),
('G');

DROP TABLE IF EXISTS Salgados; 
CREATE TABLE Salgados(
	id_salgado INT AUTO_INCREMENT PRIMARY KEY,
	recheio VARCHAR(50),
    id_tamanho INT NOT NULL,
	id_tipo INT NOT NULL,
    cor CHAR(20) NOT NULL
);

INSERT INTO Salgados (recheio, id_tamanho, id_tipo, cor) VALUES
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
	id_bebida INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL
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
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    metodo VARCHAR(50) NOT NULL
);

INSERT INTO Pagamentos (metodo) VALUES
('Dinheiro'),
('Cartão de Crédito'),
('Cartão de Débito'),
('Pix');


DROP TABLE IF EXISTS Pedidos; 
CREATE TABLE Pedidos(
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
	id_salgado INT NOT NULL,
    id_pagamento INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    total FLOAT CHECK (total > 0)
);
    
INSERT INTO Pedidos (id_salgado, id_pagamento, quantidade, total) VALUES
(1, 1, 2, 5.00),
(2, 2, 1, 3.00),
(3, 3, 3, 9.00);














    
