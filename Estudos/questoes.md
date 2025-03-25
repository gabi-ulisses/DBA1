## Questões e Respostas sobre Bancos de Dados

### Quais são as operações básicas sobre uma coleção de dados?
**R:** (Slide 4)  
As operações básicas são:
- **Criar (Create):** Inserir novos dados.
- **Consultar (Retrieve):** Acessar e recuperar dados existentes.
- **Atualizar (Update):** Modificar dados já armazenados.
- **Remover (Delete):** Excluir dados da coleção.

---

### O que é um banco de dados?
**R:** (Slide 5)  
Um banco de dados é:
- Uma **coleção de dados relacionados**, definidos por fatos conhecidos que podem ser registrados e possuem significado implícito.
- Representa aspectos do mundo real e é **construído para uma finalidade específica**.
- Consiste em uma coleção logicamente coerente de dados com significado inerente.

---

### Quais os tipos de usuários de um banco de dados?
**R:** (Slides 10 e 11)  
Os principais tipos de usuários são:
- **Administrador de Banco de Dados (DBA):**
  - Autoriza o acesso ao banco.
  - Coordena e monitora seu uso.
  - Adquire recursos de software e hardware.
- **Projetistas de Banco de Dados:**
  - Identificam os dados a serem armazenados.
  - Escolhem estruturas apropriadas para representá-los e armazená-los.
- **Usuários finais:**
  - Profissionais que consultam, modificam e geram relatórios a partir do banco.
  - Podem ser usuários comuns ou analistas de negócios.
- **Analistas de Sistemas e Programadores de Aplicações:**
  - Identificam as necessidades dos usuários finais.
  - Desenvolvem programas que acessam o banco.

---

### O que é um SGBD?
**R:** (Slide 12)  
Um Sistema de Gerenciamento de Banco de Dados (SGBD) é:
- Uma coleção de programas que permite aos usuários definir, construir e manipular um banco de dados.
- Seu principal objetivo é oferecer um ambiente eficiente e seguro para o armazenamento e consulta de dados.

---

### Explique duas propriedades de SGBD:
**R:** (Slides 16, 18, 19, 20 e 21)  
1. **Controle de Redundância:**
   - Evita esforços duplicados de atualização e inconsistências causadas por dados redundantes.
   - Armazena dados em um único local ou realiza duplicação controlada.
2. **Compartilhamento de Dados:**
   - Controla o acesso de múltiplos usuários.
   - Garante que atualizações simultâneas sejam corretas e consistentes.

Outras propriedades incluem:
- **Controle de Acesso**
- **Backup e Recuperação**
- **Múltiplas Interfaces de Usuário**
- **Restrições de Integridade**

---

### O que é um sistema de banco de dados?
**R:** (Slide 22)  
Um sistema de banco de dados é composto por:
- Aplicação + SGBD + Banco de Dados + Catálogo.

---

### O que é o catálogo de um banco de dados?
**R:** (Slide 23)  
O catálogo de um banco de dados contém **metadados**, que são dados sobre os próprios dados.