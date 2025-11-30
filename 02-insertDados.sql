-- ######################################################################
-- 2. DML: INSERÇÃO DE DADOS (INSERT)
-- ######################################################################

-- CLIENTES
INSERT INTO Cliente (nome, telefone, email, cpf) VALUES
('João Silva', '(11)98765-4321', 'joao.silva@email.com', '111.111.111-11'),
('Maria Souza', '(21)99988-7766', 'maria.souza@email.com', '222.222.222-22'),
('Pedro Almeida', '(31)98888-5555', NULL, '333.333.333-33');

-- VEÍCULOS
INSERT INTO Veiculo (placa, modelo, marca, ano, id_Cliente) VALUES
('ABC1D23', 'Onix', 'Chevrolet', 2021, 1),
('XYZ9T87', 'Fusca', 'VW', 1975, 1),
('LMN4P56', 'Kwid', 'Renault', 2019, 2);

-- MECÂNICOS
INSERT INTO Mecanico (nome, especialidade) VALUES
('Carlos Mendes', 'Motor e Câmbio'),
('Ana Ferreira', 'Elétrica'),
('Rafaela Gomes', 'Suspensão e Freios');

-- PEÇAS (Estoque)
INSERT INTO Pecas (modelo, quantidade, valor) VALUES
('Filtro de Óleo - W712', 50, 25.50),
('Pastilha de Freio Dianteira', 20, 180.00),
('Vela de Ignição NGK', 100, 15.00);

-- SERVIÇOS (Catálogo)
INSERT INTO Servico (nomeServico, precoBase) VALUES
('Troca de Óleo e Filtro', 80.00),
('Revisão Completa de Freios', 150.00),
('Alinhamento e Balanceamento', 120.00);

-- ORDEM DE SERVIÇO (OS)
INSERT INTO OrdemServico (dataAbertura, descricaoProblema, status, dataConclusao, idVeiculo) VALUES
('2025-10-01 09:00:00', 'Barulho estranho na roda dianteira.', 'Concluída', '2025-10-03 17:30:00', 1), -- idOS = 1
('2025-11-20 14:30:00', 'Manutenção preventiva (10.000km).', 'Em Serviço', NULL, 3); -- idOS = 2

-- PAGAMENTO (OS 1)
INSERT INTO Pagamento (idOS, formaPagamento, valorTotal, dataPagamento) VALUES
(1, 'Cartão de Crédito', 315.50, '2025-10-03 17:35:00');

-- ASSOCIAÇÕES N:N
INSERT INTO OS_Mecanico (idOS, idMecanico) VALUES
(1, 1), (1, 3), (2, 2);

INSERT INTO OS_PecasUtilizadas (idOS, idpecas, quantidade) VALUES
(1, 1, 1), (1, 2, 1);

INSERT INTO OS_Servico (idOS, idServico, quantidade, valorUnitario) VALUES
(1, 1, 1, 80.00),
(1, 2, 1, 150.00),
(2, 3, 1, 120.00);