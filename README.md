# Requisitos:

1) Uma conta e acesso ao Google Cloud Platform para utilização do BigQuery.
2) Um ambiente para rodar as instruções do código .ipynb. O ambiente utilizado na criação do código foi o Google Colab, e é o recomendado.

## Para utilizar o SQL:

1) Siga o tutorial [Como acessar dados no BigQuery](https://docs.dados.rio/tutoriais/como-acessar-dados/) até conseguir realizar queries no datario.
2) Utilize as queries descritas no arquivo analise_sql.sql para realizar as buscas e obter os dados que respondem às perguntas correspondentes.

## Para utilizar o Python:

1) Abra o arquivo analise_python.ipynb no Google Colab ou em outra ferramenta de sua escolha.
2) Substitua o "billing_project_id" na função "perform_query(query)" com o billing_project_id de seu projeto no BigQuery.
3) Instale pandas e basedosdados. A primeira porção do código realiza o pip install de ambos. Será necessário reiniciar o runtime após ser feita a instalação.
4) Execute cada porção do código em ordem, obtendo as respostas para as questões.

## Para as visualizações de dados:

1) Abra os PDFs na pasta "Visualizações de dados", que contém informações relevantes sobre a quantidade de chamados em relação a bairros, datas e eventos.
