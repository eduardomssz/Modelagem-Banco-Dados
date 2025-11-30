-- ######################################################################
-- 4. DML: MANIPULAÇÃO (UPDATE e DELETE) - 3x UPDATE e 3x DELETE
-- ######################################################################

-- ATUALIZAÇÃO (UPDATE)

-- 1. Aumentar o preço base de todos os serviços de 'Revisão' em 10%
UPDATE Servico
SET precoBase = precoBase * 1.10
WHERE nomeServico LIKE 'Revisão%';

-- 2. Atualizar o telefone de um cliente específico (Maria Souza)
UPDATE Cliente
SET telefone = '(21)97777-6666'
WHERE nome = 'Maria Souza';

-- 3. Atualizar o status da OS 2 para 'Concluída' e registrar a data de conclusão
UPDATE OrdemServico
SET status = 'Concluída',
    dataConclusao = NOW()
WHERE idOS = 2 AND status = 'Em Serviço';

-- EXCLUSÃO (DELETE)

-- 1. Remover a associação de um serviço da OS 2 (Ex: Remove o Alinhamento - idServico 3)
DELETE FROM OS_Servico
WHERE idOS = 2 AND idServico = 3;

-- 2. Remover um mecânico da lista de participantes da OS 1 (Ex: Remover Rafaela Gomes - idMecanico 3)
DELETE FROM OS_Mecanico
WHERE idOS = 1 AND idMecanico = 3;

-- 3. Excluir uma peça do estoque que não está mais associada à nenhuma OS (Ex: Vela de Ignição idpecas 3)
DELETE FROM Pecas
WHERE idpecas = 3;
