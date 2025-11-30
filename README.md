# ⚙️ AutoTech Manutenção: Implementação de Banco de Dados Relacional

## 💻 Experiência Prática IV: Criação e Manipulação de Dados com SQL

Este repositório documenta a fase de **implementação** do projeto **AutoTech Manutenção**, um sistema de gestão de dados para uma oficina mecânica. O projeto transiciona do Modelo Lógico (concebido nas fases anteriores) para um banco de dados relacional funcional, utilizando scripts SQL (DDL e DML).

---

## 🧐 Fundamentação Teórica: Normalização do Modelo

O modelo lógico implementado neste repositório foi rigorosamente verificado e está em conformidade com as Formas Normais, garantindo a integridade dos dados, minimizando redundância e evitando anomalias de inserção, atualização e exclusão.

### ✅ Status da Normalização (3FN)

| Forma Normal | Regra Principal | Status |
| :--- | :--- | :--- |
| **1FN** (Primeira) | Atomicidade (Um valor por célula) e Chave Primária definida. | **ATENDE PLENAMENTE** |
| **2FN** (Segunda) | Não dependência parcial de atributos não-chave da Chave Primária Composta. | **ATENDE PLENAMENTE** (Verificado em `OS_Mecanico` e `OS_PecasUtilizadas`). |
| **3FN** (Terceira) | Não dependência transitiva (Atributo não-chave não depende de outro atributo não-chave). | **ATENDE PLENAMENTE** |

---

## 🧱 Modelo Lógico Implementado

O modelo consiste em 10 entidades, estruturadas para suportar o fluxo de trabalho da oficina, desde o cadastro do cliente até a Ordem de Serviço e o Pagamento.

### Diagrama Entidade-Relacionamento (DER) - Modelo Lógico Final

A estrutura abaixo representa o modelo **revisado e normalizado**, sendo a base para os comandos `CREATE TABLE`.



---

## 🛠️ Requisitos e Tecnologias

| Requisito | Detalhe |
| :--- | :--- |
| **SGBDR** | MySQL (Comandos SQL testados e otimizados para esta sintaxe). |
| **Ferramenta** | MySQL Workbench, DBeaver ou similar. |
| **Linguagens** | DDL (Data Definition Language) e DML (Data Manipulation Language). |

---

## 📦 Estrutura dos Arquivos

Todos os comandos SQL estão consolidados em um único script para facilitar a execução sequencial:

### `implementacao_autotech.sql` (Script Principal)

| Seção | Objetivo | Comandos Utilizados | Requisitos Atendidos |
| :--- | :--- | :--- | :--- |
| **1. DDL** | Criação da estrutura do banco de dados e de todas as 10 tabelas com PKs, FKs e restrições. | `CREATE DATABASE`, `CREATE TABLE`, `FOREIGN KEY` | Implementação do Modelo Lógico. |
| **2. INSERT** | Povoamento de todas as tabelas com dados coerentes para simular o ambiente real. | `INSERT INTO` | Script com comandos de INSERT para povoar as tabelas principais. |
| **3. SELECT** | Análise e consulta de dados complexos, utilizando ligações entre várias tabelas. | `SELECT`, `JOIN`, `WHERE`, `SUM`, `GROUP BY`, `ORDER BY`, `LIMIT` | Duas a cinco consultas usando SELECT (com WHERE, ORDER BY, LIMIT, JOIN etc.). |
| **4. UPDATE/DELETE** | Demonstração da manipulação e manutenção dos dados, respeitando a integridade. | `UPDATE`, `DELETE`, `WHERE` | Ao menos três comandos de UPDATE e três de DELETE com condições. |

---

## ▶️ Instruções de Execução

Siga os passos abaixo para recriar o banco de dados e testar a manipulação dos dados:

1.  **Clone o Repositório:** Obtenha o código em sua máquina.
2.  **Abra o SGBDR:** Inicie o MySQL Workbench ou sua ferramenta preferida e conecte-se ao servidor MySQL.
3.  **Execute o Script DDL/DML:** Abra o arquivo `implementacao_autotech.sql`.
4.  **Execução Sequencial:** Execute o script em sua totalidade. Os comandos estão na ordem correta:
    * Criação do DB (`CREATE DATABASE` / `USE`).
    * Criação das tabelas (`CREATE TABLE`).
    * Inserção de dados (`INSERT`).
    * Consultas e manipulação (`SELECT`, `UPDATE`, `DELETE`).
5.  **Validação:** Use os comandos `SELECT` fornecidos na Seção 3 para verificar a integridade dos dados inseridos e a funcionalidade das consultas.

---

## 💡 Contribuição

Este projeto é a implementação prática de conceitos de Modelagem de Dados, Normalização e Linguagem SQL (DDL/DML).

Qualquer feedback sobre a otimização dos comandos ou a estrutura do modelo é bem-vindo.

**[Eduardo Martins da Silva]** **[RGM: 46246738]**
