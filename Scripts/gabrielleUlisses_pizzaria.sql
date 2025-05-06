-- Banco de Dados Pizzaria
-- Atividade 05/05 | Gabrielle Ulisses

-- Criação e uso do banco
DROP DATABASE IF EXISTS pizzaria;
CREATE DATABASE pizzaria;
USE pizzaria;

-- Tabela Cliente
DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente (
	telefone VARCHAR(12) NOT NULL,
	nome VARCHAR(20) NOT NULL,
	rua VARCHAR(50) NOT NULL,
	numero INT NOT NULL,
	compl VARCHAR(10) NULL DEFAULT 'N/A',
	bairro VARCHAR(20) NOT NULL,
	PRIMARY KEY(telefone)
);

-- Tabela Funcionario
DROP TABLE IF EXISTS Funcionario;
CREATE TABLE Funcionario (
	cpf VARCHAR(14) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	PRIMARY KEY(cpf)
);

-- Tabela Pizza
DROP TABLE IF EXISTS Pizza;
CREATE TABLE Pizza (
	codigo VARCHAR(5) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	descricao VARCHAR(200) NOT NULL,
	preco DECIMAL(8, 2),
	PRIMARY KEY(codigo)
);

-- Tabela Pedido
DROP TABLE IF EXISTS Pedido;
CREATE TABLE Pedido (
	codigo VARCHAR(8) NOT NULL,
	data_hora VARCHAR(50) NOT NULL,
	tel_cliente VARCHAR(12) NOT NULL,
	cpf_funcionario VARCHAR(14) NOT NULL,
	PRIMARY KEY(codigo),
	FOREIGN KEY (tel_cliente) REFERENCES Cliente(telefone),
	FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf)
);

-- Tabela Ingredientes_pizza
DROP TABLE IF EXISTS Ingredientes_pizza;
CREATE TABLE Ingredientes_pizza (
	nome_ingrediente VARCHAR(50) NOT NULL,
	cod_pizza VARCHAR(5) NOT NULL,
	PRIMARY KEY (nome_ingrediente, cod_pizza),
	FOREIGN KEY (cod_pizza) REFERENCES Pizza(codigo)
);

-- Tabela Item_pedido
DROP TABLE IF EXISTS Item_pedido;
CREATE TABLE Item_pedido (
	cod_pedido VARCHAR(8) NOT NULL,
	cod_pizza VARCHAR(5) NOT NULL,
	quantidade INT NOT NULL,
	PRIMARY KEY (cod_pedido, cod_pizza),
	FOREIGN KEY (cod_pedido) REFERENCES Pedido(codigo),
	FOREIGN KEY (cod_pizza) REFERENCES Pizza(codigo)
);

-- 2. A partir do banco de dados PIZZARIA, escreva instruções SQL DML para as seguintes operações:
-- a) Inserir uma linha para cada tabela do banco de dados PIZZARIA, respeitando as restrições de integridade;

	INSERT INTO Cliente(telefone, nome, rua, numero, compl, bairro)
	VALUES ('11612345678', 'Gabrielle Ulisses', 'Rua do Limão', 1234, 'N/A', 'Jardim Verde');

	INSERT INTO Funcionario(cpf, nome)
	VALUES ('123.143.469-66', 'Maria');

	-- Teste: tentativa de inserir código de pizza maior que 5 caracteres (violaria PK)
	-- INSERT INTO Pizza(codigo, nome, descricao, preco) VALUES ('A01234', 'Teste Inválido', 'Descrição', 30.00);

	-- Pizza válida
	INSERT INTO Pizza(codigo, nome, descricao, preco)
	VALUES ('A0124', 'Presunto e Queijo', 'Mussarela, catupiry, azeitona, presunto e queijo', 37.00);

	-- Teste: ingrediente com pizza inexistente (violaria FK)
	-- INSERT INTO Ingredientes_pizza(nome_ingrediente, cod_pizza) VALUES ('Tomate', 'ZZ999');

	-- Ingrediente válido
	INSERT INTO Ingredientes_pizza(nome_ingrediente, cod_pizza)
	VALUES ('Mussarela', 'A0124');

	-- Teste: pedido com telefone inválido (violaria FK)
	-- INSERT INTO Pedido(codigo, data_hora, tel_cliente, cpf_funcionario)
	-- VALUES ('0001TEST', '05-05-2025 20:00', '99999999999', '123.143.469-66');

	-- Teste: pedido com CPF de funcionário inválido (violaria FK)
	-- INSERT INTO Pedido(codigo, data_hora, tel_cliente, cpf_funcionario)
	-- VALUES ('0002TEST', '05-05-2025 20:00', '11612345678', '000.000.000-00');

	-- Pedidos válidos
	INSERT INTO Pedido(codigo, data_hora, tel_cliente, cpf_funcionario)
	VALUES
		('1234A0GF', '05-05-2025 19:55', '11612345678', '123.143.469-66'),
		('1233A0GF', '05-05-2025 19:56', '11612345678', '123.143.469-66'),
		('1235A0GF', '05-05-2025 19:57', '11612345678', '123.143.469-66'),
		('1236A0GF', '05-05-2025 19:58', '11612345678', '123.143.469-66'),
		('1237A0GF', '05-05-2025 19:59', '11612345678', '123.143.469-66'),
		('1238A0GF', '05-05-2025 20:00', '11612345678', '123.143.469-66'),
		('1239A0GF', '05-05-2025 20:01', '11612345678', '123.143.469-66');

	-- Teste: item de pedido com pizza inexistente (violaria FK)
	-- INSERT INTO Item_pedido(cod_pedido, cod_pizza, quantidade) VALUES ('1234A0GF', 'ZZ999', 2);

	-- Teste: item de pedido com pedido inexistente (violaria FK)
	-- INSERT INTO Item_pedido(cod_pedido, cod_pizza, quantidade) VALUES ('XXXXXXX', 'A0124', 2);

	-- Itens válidos
	INSERT INTO Item_pedido(cod_pedido, cod_pizza, quantidade)
	VALUES
		('1233A0GF', 'A0124', 2),
		('1235A0GF', 'A0124', 1),
		('1236A0GF', 'A0124', 3),
		('1237A0GF', 'A0124', 4),
		('1238A0GF', 'A0124', 2),
		('1239A0GF', 'A0124', 1);

-- b) Atualizar o endereço de um cliente, informando o número de telefone dele

	UPDATE Cliente 
	SET rua = 'Rua Nova'
	WHERE telefone = '11612345678';

-- c) Excluir todos ingredientes de uma pizza, informando o código da pizza

	DELETE FROM Ingredientes_pizza 
	WHERE cod_pizza = 'A0124';

-- 3. Consultas solicitadas

-- a) Duas condições no WHERE
SELECT * FROM Pedido
WHERE codigo LIKE '1234%' AND tel_cliente = '11612345678';

-- b) Operação aritmética (sem depender de WHERE lógico)
SELECT cod_pizza, quantidade, quantidade * 2 AS quantidade_dobrada
FROM Item_pedido;

-- c) ORDER BY
SELECT * FROM Pedido
ORDER BY data_hora DESC;

-- d) LIKE
SELECT * FROM Pizza
WHERE nome LIKE '%Queijo%';

-- e) IS NULL (simulando campo opcional)
UPDATE Cliente SET compl = NULL WHERE telefone = '11612345678';
SELECT * FROM Cliente WHERE compl IS NULL;

-- f) Função de agregação
SELECT cod_pizza, SUM(quantidade) AS total_vendido
FROM Item_pedido
GROUP BY cod_pizza;

-- g) Subconsulta (única linha)
SELECT * FROM Funcionario
WHERE cpf = (
	SELECT cpf_funcionario
	FROM Pedido
	WHERE codigo = '1234A0GF'
);

-- h) Subconsulta (múltiplas linhas)
SELECT * FROM Pedido
WHERE cpf_funcionario IN (
	SELECT cpf
	FROM Funcionario
	WHERE nome LIKE '%Maria%'
);