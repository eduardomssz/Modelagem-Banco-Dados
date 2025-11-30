-- ######################################################################
-- 3. DML: CONSULTAS (SELECT) - Uso de JOIN, WHERE, ORDER BY, SUM
-- ######################################################################

-- 1. Consultar o histórico completo de serviços de um cliente específico (João Silva)
SELECT
    C.nome AS Cliente, V.placa AS Placa, OS.dataAbertura AS Data_Abertura,
    S.nomeServico AS Servico_Realizado, OSV.valorUnitario AS Valor_Cobrado
FROM Cliente C
INNER JOIN Veiculo V ON C.idCliente = V.id_Cliente
INNER JOIN OrdemServico OS ON V.idVeiculo = OS.idVeiculo
LEFT JOIN OS_Servico OSV ON OS.idOS = OSV.idOS
LEFT JOIN Servico S ON OSV.idServico = S.idServico
WHERE C.nome = 'João Silva'
ORDER BY OS.dataAbertura DESC;

-- 2. Listar todas as Ordens de Serviço (OS) ativas ('Em Serviço'), ordenadas pela data de abertura
SELECT
    OS.idOS, V.placa, OS.descricaoProblema, OS.dataAbertura
FROM OrdemServico OS
INNER JOIN Veiculo V ON OS.idVeiculo = V.idVeiculo
WHERE OS.status = 'Em Serviço'
ORDER BY OS.dataAbertura ASC;

-- 3. Calcular o custo total das peças e serviços (Receita Bruta) da OS 1 (Uso de SUM e GROUP BY)
SELECT
    OS.idOS, PAG.valorTotal,
    SUM(OPU.quantidade * P.valor) AS Custo_Pecas,
    SUM(OSV.quantidade * OSV.valorUnitario) AS Custo_Servicos
FROM OrdemServico OS
INNER JOIN Pagamento PAG ON OS.idOS = PAG.idOS
LEFT JOIN OS_PecasUtilizadas OPU ON OS.idOS = OPU.idOS
LEFT JOIN Pecas P ON OPU.idpecas = P.idpecas
LEFT JOIN OS_Servico OSV ON OS.idOS = OSV.idOS
WHERE OS.idOS = 1
GROUP BY OS.idOS, PAG.valorTotal;

-- 4. Encontrar os mecânicos que trabalharam na OS 1 (Uso de JOIN para associação)
SELECT
    M.nome, M.especialidade
FROM Mecanico M
INNER JOIN OS_Mecanico OSM ON M.idMecanico = OSM.idMecanico
WHERE OSM.idOS = 1;

-- 5. Listar os modelos de peças com estoque baixo (quantidade < 50) e limitar a 5 resultados
SELECT modelo, quantidade
FROM Pecas
WHERE quantidade < 50
ORDER BY quantidade ASC
LIMIT 5;