/*
* Create by: gabrielle.ulisses@aluno.ifsp.edu.br (gabi-ulisses) in 14-03-2025 19:23
*/

USE EMPRESA;

-- 1. Listar o nome, sexo, data de nascimento e endereço completo dos funcionários.
SELECT NOME, SEXO, DATANASC, 
       CONCAT(RUA, ', ', NUMERO, ' ', IFNULL(COMPL, ''), ', ', BAIRRO, ', ', CIDADE, '-', ESTADO, ', CEP: ', CEP) AS ENDERECO_COMPLETO
FROM FUNCIONARIO;

-- 2. Listar o nome, data de nascimento e salário das funcionárias, ordenado por salário em ordem decrescente.
SELECT NOME, DATANASC, SALARIO 
FROM FUNCIONARIO 
WHERE SEXO = 'F' 
ORDER BY SALARIO DESC;

-- 3. Listar os diferentes locais de projetos cadastrados.
SELECT DISTINCT PROJLOCAL AS 'LOCAIS' 
FROM PROJETO;

-- 4. Listar nome, data de nascimento e salário dos funcionários que não trabalham no departamento 4.
SELECT NOME, DATANASC, SALARIO 
FROM FUNCIONARIO 
WHERE DNUMERO <> 4;

-- 5. Listar nome e data de nascimento das funcionárias que ganham menos de R$5.000,00.
SELECT NOME, DATANASC 
FROM FUNCIONARIO 
WHERE SALARIO < 5000 AND SEXO = 'F';

-- 6. Listar nome, data de nascimento e endereço completo dos funcionários cujo nome começa com a letra A.
SELECT NOME, DATANASC, 
       CONCAT(RUA, ', ', NUMERO, ' ', IFNULL(COMPL, ''), ', ', BAIRRO, ', ', CIDADE, '-', ESTADO, ', CEP: ', CEP) AS ENDERECO_COMPLETO
FROM FUNCIONARIO 
WHERE NOME LIKE 'A%';

-- 7. Listar nome e endereço completo dos funcionários que moram em avenidas.
SELECT NOME, 
       CONCAT(RUA, ', ', NUMERO, ' ', IFNULL(COMPL, ''), ', ', BAIRRO, ', ', CIDADE, '-', ESTADO, ', CEP: ', CEP) AS ENDERECO_COMPLETO
FROM FUNCIONARIO 
WHERE RUA LIKE 'Av.%';

-- 8. Listar nome, sexo e data de nascimento dos funcionários que nasceram na década de 60.
SELECT NOME, SEXO, DATANASC 
FROM FUNCIONARIO 
WHERE DATANASC BETWEEN '1960-01-01' AND '1969-12-31';

-- 9. Listar nome, salário atual e o salário com reajuste de 5% para todos os funcionários.
SELECT NOME, SALARIO, 
       ROUND(SALARIO * 1.05, 2) AS SALARIO_REAJUSTADO 
FROM FUNCIONARIO;

-- 10. Listar os CPFs dos funcionários que trabalham mais de 10 horas no projeto de número 3.
SELECT CPF 
FROM ATRIBUICAO 
WHERE PROJNUMERO = 3 AND HORAS > 10;

-- 11. Listar nome e salário dos funcionários que ganham entre R$ 4.000,00 e R$ 6.000,00.
SELECT NOME, SALARIO 
FROM FUNCIONARIO 
WHERE SALARIO BETWEEN 4000 AND 6000;

-- 12. Listar os CPFs dos funcionários que atuam nos projetos de número 1, 2 ou 3.
SELECT DISTINCT CPF 
FROM ATRIBUICAO 
WHERE PROJNUMERO IN (1, 2, 3);

-- 13. Listar a menor e a maior carga horária atribuída a um funcionário.
SELECT MIN(HORAS) AS MENOR_CARGA, 
       MAX(HORAS) AS MAIOR_CARGA 
FROM ATRIBUICAO;

-- 14. Listar a soma dos salários dos funcionários que trabalham no departamento 4.
SELECT SUM(SALARIO) AS SOMA_SALARIOS 
FROM FUNCIONARIO 
WHERE DNUMERO = 4;

-- 15. Listar a média salarial dos funcionários por departamento.
SELECT DNUMERO, 
       ROUND(AVG(SALARIO), 2) AS MEDIA_SALARIO 
FROM FUNCIONARIO 
GROUP BY DNUMERO;

-- 16. Listar a quantidade de projetos que o funcionário de CPF 1234 atua.
SELECT COUNT(*) AS QTD_PROJETOS 
FROM ATRIBUICAO 
WHERE CPF = '1234';

-- 17. Listar a quantidade de projetos que cada funcionário atua.
SELECT CPF, 
       COUNT(*) AS QTD_PROJETOS 
FROM ATRIBUICAO 
GROUP BY CPF;

-- 18. Listar a média salarial dos funcionários que moram em São Paulo.
SELECT ROUND(AVG(SALARIO), 2) AS MEDIA_SALARIO_SP 
FROM FUNCIONARIO 
WHERE CIDADE = 'São Paulo';

-- 19. Listar a média salarial dos funcionários por cidade.
SELECT CIDADE, 
       ROUND(AVG(SALARIO), 2) AS MEDIA_SALARIO 
FROM FUNCIONARIO 
GROUP BY CIDADE;

-- 20. Listar o nome e a idade dos funcionários.
SELECT NOME, 
       TIMESTAMPDIFF(YEAR, DATANASC, CURDATE()) AS IDADE 
FROM FUNCIONARIO;
