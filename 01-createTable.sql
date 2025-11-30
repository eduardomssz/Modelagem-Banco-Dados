-- ######################################################################
-- 1. DDL: CRIAÇÃO DA ESTRUTURA (CREATE TABLE)
-- ######################################################################

-- Criação do Banco de Dados
CREATE DATABASE AutoTechManutencao;
USE AutoTechManutencao;

-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone CHAR(15) NOT NULL,
    email VARCHAR(100) NULL,
    cpf CHAR(14) NOT NULL UNIQUE
);

-- Tabela Veiculo
CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    placa CHAR(7) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano YEAR NOT NULL,
    id_Cliente INT NOT NULL,
    FOREIGN KEY (id_Cliente) REFERENCES Cliente(idCliente)
);

-- Tabela Mecanico
CREATE TABLE Mecanico (
    idMecanico INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) NULL
);

-- Tabela Pecas
CREATE TABLE Pecas (
    idpecas INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade >= 0),
    valor DECIMAL(8, 2) NOT NULL
);

-- Tabela Servico
CREATE TABLE Servico (
    idServico INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeServico VARCHAR(100) NOT NULL UNIQUE,
    precoBase DECIMAL(8, 2) NOT NULL
);

-- Tabela OrdemServico (OS)
CREATE TABLE OrdemServico (
    idOS INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dataAbertura DATETIME NOT NULL,
    descricaoProblema VARCHAR(500) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Aberta',
    dataConclusao DATETIME NULL,
    problemas VARCHAR(500) NULL,
    idVeiculo INT NOT NULL,
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);

-- Tabela Pagamento (Relação 1:1)
CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    formaPagamento VARCHAR(50) NOT NULL,
    valorTotal DECIMAL(10, 2) NOT NULL,
    dataPagamento DATETIME NOT NULL,
    idOS INT NOT NULL UNIQUE,
    FOREIGN KEY (idOS) REFERENCES OrdemServico(idOS)
);

-- TABELAS ASSOCIATIVAS (N:N)
-- Tabela OS_Mecanico (Chave Composta: idOS + idMecanico)
CREATE TABLE OS_Mecanico (
    idOS INT NOT NULL,
    idMecanico INT NOT NULL,
    PRIMARY KEY (idOS, idMecanico),
    FOREIGN KEY (idOS) REFERENCES OrdemServico(idOS),
    FOREIGN KEY (idMecanico) REFERENCES Mecanico(idMecanico)
);

-- Tabela OS_PecasUtilizadas (Chave Composta: idOS + idpecas)
CREATE TABLE OS_PecasUtilizadas (
    idOS INT NOT NULL,
    idpecas INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (idOS, idpecas),
    FOREIGN KEY (idOS) REFERENCES OrdemServico(idOS),
    FOREIGN KEY (idpecas) REFERENCES Pecas(idpecas)
);

-- Tabela OS_Servico (Chave Artificial)
CREATE TABLE OS_Servico (
    idosServico INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idOS INT NOT NULL,
    idServico INT NOT NULL,
    quantidade SMALLINT NOT NULL,
    valorUnitario DECIMAL(8, 2) NOT NULL,
    UNIQUE (idOS, idServico),
    FOREIGN KEY (idOS) REFERENCES OrdemServico(idOS),
    FOREIGN KEY (idServico) REFERENCES Servico(idServico)
);
