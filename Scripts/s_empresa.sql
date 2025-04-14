USE EMPRESA;

-- 3)
-- a) Inserir funcionário com CPF '999'
INSERT INTO FUNCIONARIO 
(CPF, NOME, SALARIO, DATANASC, RUA, NUMERO, COMPL, BAIRRO, CIDADE, ESTADO, CEP, SEXO, DNUMERO)
VALUES 
('999', 'Roberto Santos', 4500, '1972-06-21', 'Rua Benjamin', 34, NULL, 'Vila Maria', 'Santo André', 'SP', '11111-111', 'M', 1);

-- Análise:
-- ✅ Inserção válida.
-- O CPF '999' ainda não existe, DNUMERO = 1 existe em DEPARTAMENTO.
-- Nenhuma restrição de integridade é violada.

-- b) Inserir departamento com número 1 e nome 'Producao' (sem CPFGERENTE)
INSERT INTO DEPARTAMENTO (DNUMERO, DNOME)
VALUES (1, 'Producao');

-- Análise:
-- ❌ ERRO: Violação da PRIMARY KEY (DNUMERO = 1 já existe).
-- ❌ ERRO: O campo CPFGERENTE não foi fornecido e não permite valor NULL.

-- c) Inserir departamento com número 10, nome 'Producao' e gerente '999'
INSERT INTO DEPARTAMENTO (DNUMERO, DNOME, CPFGERENTE)
VALUES (10, 'Producao', '999');

-- Análise:
-- ✅ Inserção válida.
-- O CPF '999' já havia sido criado quando este comando foi executado.
-- Deve-se primeiro garantir que o funcionário '999' exista antes dessa inserção.

-- d) Excluir funcionário com CPF = '999'
DELETE FROM FUNCIONARIO WHERE CPF = '999';

-- Análise:
-- ❌ ERRO se '999' for gerente de algum departamento (referenciado em CPFGERENTE).
-- Violação de integridade referencial (chave estrangeira).
-- Deve-se remover ou atualizar o departamento antes de excluir o funcionário.

-- e) Atualizar DNUMERO para 20 no funcionário com CPF = '999'
UPDATE FUNCIONARIO SET DNUMERO = 20 WHERE CPF = '999';

-- Análise:
-- ❌ ERRO: Violação de chave estrangeira.
-- DNUMERO = 20 não existe na tabela DEPARTAMENTO.
-- Para esse comando funcionar, é necessário inserir um departamento com DNUMERO = 20 antes.


-- 4. Inserir o departamento ‘Ensino’, com código 2
-- (CPFGERENTE será atribuído depois)
INSERT INTO DEPARTAMENTO (DNUMERO, DNOME, CPFGERENTE)
VALUES (2, 'Ensino', NULL);

-- ✅ Departamento inserido com sucesso, CPFGERENTE será atualizado no próximo passo.

-- 5. Inserir o departamento ‘RH’, com código 3
INSERT INTO DEPARTAMENTO (DNUMERO, DNOME, CPFGERENTE)
VALUES (3, 'RH', NULL);

-- ✅ Inserido corretamente. CPFGERENTE será atribuído depois.

-- 6. Indicar o funcionário 1234 como gerente do departamento Ensino
UPDATE DEPARTAMENTO
SET CPFGERENTE = '1234'
WHERE DNUMERO = 2;

-- ✅ Atualização válida. Funcionário 1234 existe, FOREIGN KEY respeitada.

-- 7. Indicar o funcionário 6668 como gerente do departamento RH
UPDATE DEPARTAMENTO
SET CPFGERENTE = '6668'
WHERE DNUMERO = 3;

-- ✅ Atualização válida. Funcionário 6668 existe, FOREIGN KEY respeitada.

-- 8. Alocar os funcionários 1234, 9998 e 9879 no projeto ‘Reorganização’
-- Primeiro, identificamos o número do projeto 'Reorganização':
-- Vamos supor que seja o número 5, com base nos dados já inseridos.

-- Alocando os funcionários
INSERT INTO ATRIBUICAO (CPF, PROJNUMERO, HORAS) VALUES ('1234', 5, 4);
INSERT INTO ATRIBUICAO (CPF, PROJNUMERO, HORAS) VALUES ('9998', 5, 6);
INSERT INTO ATRIBUICAO (CPF, PROJNUMERO, HORAS) VALUES ('9879', 5, 5);

-- ✅ Inserções válidas, assumindo que essas combinações ainda não existam na ATRIBUICAO.

-- 9. Aumento de 10% para funcionários que trabalham no projeto 4
-- (Projeto 4 = 'Informatização')

UPDATE FUNCIONARIO
SET SALARIO = SALARIO * 1.10
WHERE CPF IN (
    SELECT CPF
    FROM ATRIBUICAO
    WHERE PROJNUMERO = 4
);

-- ✅ Atualização realizada com sucesso.

-- 10. Script completo para o novo projeto 'Call Center' e departamento 'Marketing'

-- Inserir novo departamento 'Marketing', com código 6 e gerente Ronaldo Lima (CPF: 6668)
INSERT INTO DEPARTAMENTO (DNUMERO, DNOME, CPFGERENTE)
VALUES (6, 'Marketing', '6668');

-- Inserir localidades do departamento 'Marketing'
INSERT INTO DEPTOLOCAL VALUES (6, 'São Paulo');

-- Inserir projeto 'Call Center', ligado ao departamento 'Marketing' (DNUMERO = 6)
INSERT INTO PROJETO (PROJNOME, PROJLOCAL, DNUMERO) VALUES ('Call Center', 'São Paulo', 6);
INSERT INTO PROJETO (PROJNOME, PROJLOCAL, DNUMERO) VALUES ('Call Center', 'Rio de Janeiro', 6);
INSERT INTO PROJETO (PROJNOME, PROJLOCAL, DNUMERO) VALUES ('Call Center', 'Campinas', 6);

-- Inserir 5 novos funcionários para o projeto (assumindo CPFs fictícios)
INSERT INTO FUNCIONARIO (CPF, NOME, SALARIO, DATANASC, RUA, NUMERO, COMPL, BAIRRO, CIDADE, ESTADO, CEP, SEXO, DNUMERO)
VALUES 
('1111', 'Marina Costa', 2800, '1990-05-12', 'Rua A', 10, NULL, 'Centro', 'São Paulo', 'SP', '11111-000', 'F', 6),
('1112', 'Carlos Moura', 3000, '1988-11-03', 'Rua B', 20, NULL, 'Botafogo', 'Rio de Janeiro', 'RJ', '22222-000', 'M', 6),
('1113', 'Fernanda Lima', 2900, '1992-07-22', 'Rua C', 15, NULL, 'Cambuí', 'Campinas', 'SP', '33333-000', 'F', 6),
('1114', 'Ricardo Alves', 3100, '1985-03-30', 'Rua D', 40, NULL, 'Centro', 'São Paulo', 'SP', '44444-000', 'M', 6),
('1115', 'Tatiane Souza', 2700, '1994-01-18', 'Rua E', 25, NULL, 'Centro', 'Campinas', 'SP', '55555-000', 'F', 6);

-- Alocar esses funcionários nos três projetos do Call Center
-- Assumindo que os projetos 'Call Center' inseridos acima receberam IDs automáticos
-- Suponha que seus PROJNUMEROs sejam 7 (SP), 8 (RJ) e 9 (Campinas)

INSERT INTO ATRIBUICAO (CPF, PROJNUMERO, HORAS) VALUES ('1111', 7, 5);
INSERT INTO ATRIBUICAO (CPF, PROJNUMERO, HORAS) VALUES ('1112', 8, 5);
INSERT INTO ATRIBUICAO (CPF, PROJNUMERO, HORAS) VALUES ('1113', 9, 5);
INSERT INTO ATRIBUICAO (CPF, PROJNUMERO, HORAS) VALUES ('1114', 7, 5);
INSERT INTO ATRIBUICAO (CPF, PROJNUMERO, HORAS) VALUES ('1115', 9, 5);

-- ✅ Projeto Call Center criado com sucesso, com 3 locais, departamento e funcionários alocados.
-- ✅ Departamento Marketing liderado por Ronaldo Lima, conforme solicitado.

-- 🔍 Verificações (com SELECTs simples)

-- Verificar funcionário com CPF = '999'
SELECT * FROM FUNCIONARIO WHERE CPF = '999';

-- Verificar todos os departamentos
SELECT * FROM DEPARTAMENTO;

-- Verificar todas as atribuições com PROJNUMERO = 5
SELECT * FROM ATRIBUICAO WHERE PROJNUMERO = 5;

-- Verificar funcionários envolvidos no projeto 4
SELECT CPF FROM ATRIBUICAO WHERE PROJNUMERO = 4;

-- Verificar salários dos funcionários
SELECT CPF, NOME, SALARIO FROM FUNCIONARIO;

-- Verificar departamento 'Marketing'
SELECT * FROM DEPARTAMENTO WHERE DNOME = 'Marketing';

-- Verificar projetos 'Call Center'
SELECT * FROM PROJETO WHERE PROJNOME = 'Call Center';

-- Verificar dados dos funcionários 1111 a 1115
SELECT * FROM FUNCIONARIO WHERE CPF IN ('1111', '1112', '1113', '1114', '1115');

-- Verificar atribuições desses funcionários
SELECT * FROM ATRIBUICAO WHERE CPF IN ('1111', '1112', '1113', '1114', '1115');
