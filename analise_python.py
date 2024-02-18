import basedosdados as bd

def perform_query(query):
    df = bd.read_sql(query, billing_project_id="desafio-junior-414307")
    return df


queries = {
    1: '''SELECT COUNT(*) as quantidade
FROM datario.administracao_servicos_publicos.chamado_1746
WHERE DATE(data_inicio) = '2023-04-01'
''',

    2: '''SELECT id_tipo, tipo, COUNT(*) as quantidade
FROM datario.administracao_servicos_publicos.chamado_1746
WHERE DATE(data_inicio) = '2023-04-01'
GROUP BY id_tipo, tipo
ORDER BY quantidade DESC
LIMIT 1
''',

    3: '''SELECT adm.id_bairro, bai.nome, COUNT(*) as quantidade
FROM datario.administracao_servicos_publicos.chamado_1746 as adm
INNER JOIN datario.dados_mestres.bairro as bai on adm.id_bairro = bai.id_bairro 
WHERE DATE(data_inicio) = '2023-04-01'
GROUP BY adm.id_bairro, bai.nome
ORDER BY quantidade DESC
LIMIT 3
''',

    4: '''SELECT bai.subprefeitura, COUNT(*) as quantidade
FROM datario.administracao_servicos_publicos.chamado_1746 as adm
INNER JOIN datario.dados_mestres.bairro as bai on adm.id_bairro = bai.id_bairro 
WHERE DATE(data_inicio) = '2023-04-01'
GROUP BY bai.subprefeitura
ORDER BY quantidade DESC
LIMIT 1
''',

    5: '''SELECT *
FROM datario.administracao_servicos_publicos.chamado_1746 as adm
WHERE DATE(data_inicio) = '2023-04-01'
AND adm.id_bairro IS NULL
LIMIT 1
''',

    6: '''SELECT adm.subtipo, COUNT(*) as quantidade
FROM datario.administracao_servicos_publicos.chamado_1746 as adm
WHERE adm.subtipo = 'Perturbação do sossego'
AND DATE(adm.data_inicio) between '2022-01-01' and '2023-12-31'
GROUP BY adm.subtipo
''',

    7: '''SELECT adm.*
FROM datario.administracao_servicos_publicos.chamado_1746 as adm
INNER JOIN datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos as ev on DATE(adm.data_inicio) between ev.data_inicial and ev.data_final
WHERE adm.subtipo = 'Perturbação do sossego'
AND ev.evento in ('Reveillon', 'Carnaval', 'Rock in Rio')
''',

    8: '''SELECT ev.evento, COUNT(*) as quantidade
FROM datario.administracao_servicos_publicos.chamado_1746 as adm
INNER JOIN datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos as ev on DATE(adm.data_inicio) between ev.data_inicial and ev.data_final
WHERE adm.subtipo = 'Perturbação do sossego'
AND ev.evento in ('Reveillon', 'Carnaval', 'Rock in Rio')
GROUP BY ev.evento
'''
}

def question(number):
    return(perform_query(queries[number]))


while(True):
    try:
        number = int(input("Insira o número da questão desejada ou 0 para fechar o programa: "))
        if number == 0:
            break
        if number in range(1,10):
            df = question(number)
            print(df.head())
    except:
        print("Erro. Por favor, tente novamente")