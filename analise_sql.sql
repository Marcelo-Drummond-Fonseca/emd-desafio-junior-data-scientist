--Questao 1

SELECT COUNT(*)
FROM datario.administracao_servicos_publicos.chamado_1746
WHERE DATE(data_inicio) = '2023-04-01'

--Resposta obtida: 73



--Questão 2

SELECT id_tipo, tipo, COUNT(*) as quantidade
FROM datario.administracao_servicos_publicos.chamado_1746
WHERE DATE(data_inicio) = '2023-04-01'
GROUP BY id_tipo, tipo
ORDER BY quantidade DESC
LIMIT 1

--Resposta obtida: Poluição Sonora, com 24 chamados.



-- Questão 3

SELECT adm.id_bairro, bai.nome, COUNT(*) as quantidade
FROM datario.administracao_servicos_publicos.chamado_1746 as adm
INNER JOIN datario.dados_mestres.bairro as bai on adm.id_bairro = bai.id_bairro 
WHERE DATE(data_inicio) = '2023-04-01'
GROUP BY adm.id_bairro, bai.nome
ORDER BY quantidade DESC
LIMIT 3

--Resposta obtida: Engenho de Dentro, Campo Grande e Leblon



-- Questão 4

SELECT bai.subprefeitura, COUNT(*) as quantidade
FROM datario.administracao_servicos_publicos.chamado_1746 as adm
INNER JOIN datario.dados_mestres.bairro as bai on adm.id_bairro = bai.id_bairro 
WHERE DATE(data_inicio) = '2023-04-01'
GROUP BY bai.subprefeitura
ORDER BY quantidade DESC
LIMIT 1

--Resposta obtida: Zona Norte, com 25 chamados



-- Questão 5

SELECT *
FROM datario.administracao_servicos_publicos.chamado_1746 as adm
WHERE DATE(data_inicio) = '2023-04-01'
AND adm.id_bairro IS NULL
LIMIT 1

--Resposta obtida: Houve um caso, mas estou incerto da razão de ter ocorrído.



-- Questão 6

SELECT adm.subtipo, COUNT(*) as quantidade
FROM datario.administracao_servicos_publicos.chamado_1746 as adm
WHERE adm.subtipo = 'Perturbação do sossego'
AND DATE(adm.data_inicio) >= '2022-01-01'
AND DATE(adm.data_inicio) <= '2023-12-31'
GROUP BY adm.subtipo

--Resposta obtida: 42408 chamados com o subtipo Perturbação do Sossego no período.



-- Questão 7

SELECT adm.*
FROM datario.administracao_servicos_publicos.chamado_1746 as adm
INNER JOIN datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos as ev on adm.data_inicio between ev.data_inicial and ev.data_final
WHERE adm.subtipo = 'Perturbação do sossego'
AND ev.evento in ('Reveillon', 'Carnaval', 'Rock in Rio')

--Resposta obtida: Multiplos chamados durante os períodos.



-- Questão 8

SELECT ev.evento, COUNT(*) as quantidade
FROM datario.administracao_servicos_publicos.chamado_1746 as adm
INNER JOIN datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos as ev on adm.data_inicio between ev.data_inicial and ev.data_final
WHERE adm.subtipo = 'Perturbação do sossego'
AND ev.evento in ('Reveillon', 'Carnaval', 'Rock in Rio')
GROUP BY ev.evento

--Resposta obtida: 79 pro Reveillon, 518 pro Rock in Rio, 197 pro Carnaval



-- Questão 9

SELECT ev.evento, COUNT(*) as quantidade, DATE_DIFF(ev.data_final, ev.data_inicial, DAY) + 1 as dias
FROM datario.administracao_servicos_publicos.chamado_1746 as adm
INNER JOIN datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos as ev on adm.data_inicio between ev.data_inicial and ev.data_final
WHERE adm.subtipo = 'Perturbação do sossego'
AND ev.evento in ('Reveillon', 'Carnaval', 'Rock in Rio')
GROUP BY ev.evento, dias

--Resposta obtida: O Reveillon e Carnaval foram marcados como tendo 3 e 4 dias respectivamente, e tiveram 79 e 197 chamados respectivamente
--Assim, media diária de 26.3 pro Reveilllon e 49.25 pro Carnaval.
--O Rock in Rio foi separado em dois grupos, um com 3 dias e um com 4 dias, com 212 e 306 chamados respectivamente.
--Em ambos casos, a média é maior que 70 chamados por dia, então de qualquer forma, Rock in Rio é o que tem a maior quantidade de chamadas diárias, em média.



-- Questão 10

--Resposta: O período de 2 anos tem média diária de chamados de aproximadamente 42408/730 ~= 58 chamadas diárias.
--Curiosamente, essa média é maior que a média de chamadas durante o Carnaval e Reveillon, mas menor que a do Rock in Rio