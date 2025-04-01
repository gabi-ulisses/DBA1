USE agenda;

INSERT INTO Contatos(nome, tel, idCidade)
VALUES 
    ('Gabrielle', '(16) 1234-1234', 1), 
    ('Carlos','(16) 1234-1234', 2), 
    ('Ana','(16) 1234-1234', 3);
    
INSERT INTO Cidade(nome)
VALUES 
    ('Araraquara'), 
    ('São Carlos'), 
    ('Boa ESperança do Sul');
    
    
SELECT * FROM Contatos;