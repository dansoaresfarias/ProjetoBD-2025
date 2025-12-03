# 🏨 Pousada Sol da Manhã  
### Banco de Dados – DDL & DML  
#### Professor: **Danilo Farias** – Faculdade SENAC PE  
#### Equipe: **Jerferson Paulo, Edvaldo Alves, Juan Barreto, Kleiton Antunes, Danilo Soares**

---

## 📘 Minimundo do Projeto

A Pousada **Sol da Manhã** é um pequeno estabelecimento hoteleiro que necessita informatizar seus processos internos, abrangendo desde o gerenciamento de funcionários até o controle de hospedagens, reservas, produtos, consumos e organização departamental. O banco de dados desenvolvido por nossa equipe visa atender integralmente essas demandas, garantindo segurança, integridade e eficiência no tratamento das informações.

Este minimundo descreve o cenário realista que serviu de base para o desenvolvimento do modelo conceitual (MER), modelo relacional e scripts SQL (DDL e DML).

---

## 🧩 1. Recursos Humanos (RH)

A pousada mantém um registro completo de todos os seus **funcionários**, armazenando dados pessoais, profissionais e financeiros. Entre as informações cadastradas estão:

- CPF, nome e nome social;
- data de nascimento e estado civil;
- gênero e carteira de trabalho;
- salário, carga horária e função gratificada;
- chave PIX para pagamentos.

Cada funcionário possui:

- Um **endereço** completo (rua, número, bairro, cidade, UF, CEP);
- Um ou mais **telefones** cadastrados;
- Zero ou mais **dependentes**, com CPF, nome, data de nascimento e grau de parentesco;
- Registros de **ocorrências internas**, que documentam eventos relevantes com data/hora, descrição e gravidade;
- Registros de **ponto**, indicando entradas, saídas e justificativas quando necessário;
- Registros de **férias**, indicando período, quantidade de dias, ano de referência, valor e se houve adiantamento do 13º salário.

A pousada é organizada em **departamentos**, cada um podendo ter um funcionário gerente. Os funcionários também podem ser vinculados a diferentes **cargos** ao longo do tempo, e esses vínculos são registrados com datas de início e término.

---

## 🛏️ 2. Hóspedes e Hospedagens

A pousada registra todos os seus **hóspedes**, identificados por documento oficial. Para cada hóspede, são armazenados:

- nome completo;
- data de nascimento;
- gênero;
- telefone e e-mail;
- indicação se possui alguma necessidade especial (PCD);
- identificação de um responsável, caso necessário (útil para menores de idade ou dependentes).

Quando um hóspede decide se hospedar, é criada uma **reserva**, contendo:

- data/hora prevista de entrada e saída;
- quantidade total de hóspedes;
- valor adiantado;
- situação da reserva (ativa, cancelada, concluída etc.);
- funcionário que realizou o atendimento;
- hóspede responsável pela reserva.

A pousada conta com diversas **unidades hoteleiras**, como quartos e chalés, cada uma com:

- nome;
- valor da diária;
- tipo da acomodação;
- capacidade máxima de hóspedes.

Uma reserva pode ocupar uma ou mais unidades, permitindo flexibilidade em períodos de alta demanda.

A **hospedagem** é criada no momento do **check-in**, contendo:

- data e hora de entrada;
- data e hora de saída (check-out), quando aplicável;
- valor total calculado com base nas diárias e produtos consumidos;
- possíveis descontos aplicados.

Durante a hospedagem, um hóspede pode consumir produtos, serviços e itens adicionais. Todos os consumos são registrados individualmente, garantindo precisão no fechamento financeiro.

---

## 🍽️ 3. Produtos e Consumo

A pousada mantém um estoque de **produtos**, tais como:

- bebidas;
- snacks;
- itens de higiene;
- produtos de conveniência.

Para cada produto são registrados:

- nome;
- tipo;
- quantidade em estoque;
- valor unitário.

Durante a hospedagem, caso sejam consumidos, é gerado um registro contendo:

- o produto consumido;
- quantidade;
- valor considerado no momento do consumo;
- a hospedagem associada.

---

## 🚀 4. Fluxo Geral de Funcionamento do Sistema

1. O funcionário cadastra o hóspede.
2. O hóspede realiza uma reserva e informa as datas desejadas.
3. A reserva é associada a uma ou mais unidades hoteleiras disponíveis.
4. No check-in, é criada a hospedagem.
5. Durante a estadia, são registrados os consumos de produtos.
6. No check-out, o sistema calcula:
   - valor total das diárias;
   - total dos consumos;
   - descontos aplicados.
7. O processo é finalizado e a unidade é liberada para novas reservas.

---

## 🏗️ 5. Conteúdo do Repositório

- `/ddl/` → Scripts SQL de criação de tabelas e estruturas (DDL).  
- `/dml/` → Scripts SQL de inserção, atualização e consultas (DML).  
- `/diagramas/` → MER e Modelo Relacional do banco de dados.  
- `README.md` → Este arquivo, contendo a descrição completa do minimundo.

---

## 🎯 Objetivo Educacional

Este projeto foi desenvolvido como parte da disciplina **Banco de Dados: DDL & DML**, ministrada pelo professor **Danilo Farias**, no curso de Análise e Desenvolvimento de Sistemas da **Faculdade SENAC Pernambuco**.

O objetivo é desenvolver competências práticas relacionadas a:

- modelagem conceitual e lógica;
- criação de bancos de dados com DDL;
- manipulação e consulta de dados com DML;
- documentação e versionamento de software;
- compreensão de regras de negócio reais aplicadas em ambientes corporativos.

---

## 👨‍🏫 Professor responsável
**Danilo Farias**  
Faculdade SENAC – Curso de Análise e Desenvolvimento de Sistemas  

---

## 👥 Equipe
- **Jerferson Paulo**  
- **Edvaldo Alves**  
- **Juan Barreto**  
- **Kleiton Antunes**  
- **Danilo Soares**

---

