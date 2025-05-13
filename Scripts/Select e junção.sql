-- Banco de Dados Empresa
-- Atividade 12/05 | Gabrielle Ulisses

USE EMPRESA;

-- 1. Consultar pelo nome e salário dos funcionários que trabalham no departamento com nome =
-- Pesquisa, ordenando os resultados do menor para o maior salário

SELECT F.NOME, F.SALARIO
FROM FUNCIONARIO F, DEPARTAMENTO D
WHERE F.DNUMERO = D.DNUMERO
AND D.DNOME = 'Pesquisa'
ORDER BY SALARIO;

-- 2. Recuperar nome dos departamentos localizados em São Paulo.

SELECT D.DNOME
FROM DEPARTAMENTO D, DEPTOLOCAL DL
WHERE D.DNUMERO = DL.DNUMERO
AND DL.NOMELOCAL = 'São Paulo';

-- 3. Consultar nome dos projetos controlados pelos departamentos de pesquisa ou de administração.

SELECT P.PROJNOME AS 'Nome do Projeto'
FROM PROJETO P, DEPARTAMENTO D
WHERE P.DNUMERO = D.DNUMERO
AND (D.DNOME = 'Administração' OR D.DNOME = 'Pesquisa');

-- 4. Recuperar os nomes de departamentos que controlam projetos localizados em São Paulo.

SELECT D.DNOME AS 'Nome do Departamento'
FROM DEPARTAMENTO D, PROJETO P
WHERE D.DNUMERO = P.DNUMERO
AND P.PROJLOCAL = 'Sao Paulo';

-- 5. Recuperar CPF e carga horária dos funcionários atribuídos para o projeto com nome = Novos
-- benefícios, ordenando os resultados da maior para a menor carga horária.

SELECT A.CPF, A.HORAS, P.PROJNOME AS 'Nome do Projeto'
FROM ATRIBUICAO A, PROJETO P
WHERE A.PROJNUMERO = P.PROJNUMERO
AND P.PROJNOME = 'Novos beneficios'
ORDER BY A.HORAS DESC;

-- 6. Recuperar CPF e carga horária dos funcionários atribuídos para os projetos com nome contendo o
-- termo Produto, ordenando os resultados da maior para a menor carga horária.

SELECT A.CPF, A.HORAS, P.PROJNOME AS 'Nome do Projeto'
FROM ATRIBUICAO A, PROJETO P
WHERE A.PROJNUMERO = P.PROJNUMERO
AND P.PROJNOME LIKE '%Produto%'
ORDER BY A.HORAS DESC;

-- 7. Calcule o total de horas atribuídas em projetos para o funcionário com nome = 'Fernando Wong'.

SELECT SUM(A.HORAS) AS 'Total de Horas'
FROM ATRIBUICAO A, FUNCIONARIO F
WHERE A.CPF = F.CPF
AND F.NOME = 'Fernando Wong';

-- 8.  Calcule a quantidade de funcionários atribuídos para o projeto com nome = Produto Y.

SELECT COUNT(A.CPF) AS 'Quantidade de funcionários atribuídos ao projeto Produto Y'
FROM ATRIBUICAO A, PROJETO P
WHERE A.PROJNUMERO = P.PROJNUMERO
AND P.PROJNOME = 'Produto Y';

-- 9. Recuperar a quantidade de funcionários atribuídos por nome de projeto.

SELECT P.PROJNOME AS 'Nome do Projeto', COUNT(A.CPF) AS 'Quantidade de funcionários'
FROM ATRIBUICAO A, PROJETO P
WHERE A.PROJNUMERO = P.PROJNUMERO
GROUP BY P.PROJNOME;

-- 10. Recuperar o total de horas atribuídas em projetos por nome de funcionário.

SELECT F.NOME, SUM(A.HORAS) AS 'Total de Horas em Projetos'
FROM ATRIBUICAO A, FUNCIONARIO F
WHERE A.CPF = F.CPF
GROUP BY F.NOME;

-- 11. Recuperar nome, salário e carga horária dos funcionários atribuídos para os projetos com nome
-- contendo o termo Produto, ordenando os resultados da maior para a menor carga horária

SELECT F.NOME, F.SALARIO, A.HORAS
FROM FUNCIONARIO F, ATRIBUICAO A, PROJETO P
WHERE F.CPF = A.CPF
AND A.PROJNUMERO = P.PROJNUMERO
AND P.PROJNOME LIKE '%Produto%'
ORDER BY A.HORAS DESC;

-- 12. Consultar nome dos projetos controlados por departamentos localizados em São Paulo.

SELECT P.PROJNOME AS 'Nome do Projeto'
FROM PROJETO P, DEPARTAMENTO D, DEPTOLOCAL DL
WHERE P.DNUMERO = D.DNUMERO
AND D.DNUMERO - DL.DNUMERO
AND DL.NOMELOCAL = 'Sao Paulo';

-- 13. Recuperar a média de salário dos funcionários que trabalham em departamentos localizados em São Paulo

SELECT AVG(F.SALARIO) AS 'Média de Salário'
FROM FUNCIONARIO F, DEPARTAMENTO D, DEPTOLOCAL DL
WHERE F.DNUMERO = D.DNUMERO
AND D.DNUMERO - DL.DNUMERO
AND DL.NOMELOCAL = 'Sao Paulo';

-- 14. Consultar o nome dos projetos em que trabalham funcionários do sexo feminino.

SELECT P.PROJNOME AS 'Nome do Projeto'
FROM PROJETO P, ATRIBUICAO A, FUNCIONARIO F
WHERE P.PROJNUMERO = A.PROJNUMERO
AND A.CPF = F.CPF
AND F.SEXO = 'F';

-- 15. Consultar o nome dos projetos controlados por departamentos gerenciados por funcionários do sexo masculino.

SELECT P.PROJNOME AS 'Nome do Projeto'
FROM PROJETO P, DEPARTAMENTO D, FUNCIONARIO F
WHERE P.DNUMERO = D.DNUMERO
AND D.CPFGERENTE = F.CPF
AND F.SEXO = 'M';