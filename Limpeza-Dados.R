


library(dplyr)
library(ggplot2)

# Carregando o dataset
dataset <- read.csv("dataset.csv")

View(dataset)
str(dataset)


##### Análise Exploratória dos Dados - Limpeza dos Dados. #####
summary(dataset)

# Observo que existem valores missing em todas as colunas, exceto Country.name, year e Life.ladder


# Quantas linhas tem casos completos ?
complete_cases <- sum(complete.cases(dataset))
complete_cases
## Ou seja, dos 1949 registros, temos que 1708 são completos, ou seja, sem nenhuma informação faltante.

not_complete_cases <- sum(!complete.cases(dataset))
not_complete_cases
## Logo, temos que 241 registros estão incompletos.


# Qual o percentual de casos incompletos ? 
percentual <- (not_complete_cases/complete_cases) * 100
percentual
## Temos que aproximadamente 14% dos dados do dataset estão incompletos


# Remove os objetos anteriores para liberar memória RAM
rm(complete_cases)
rm(not_complete_cases)


# Nomes das colunas
colnames(dataset)


# Gravando os nomes das colunas em um vetor
myColumns <- colnames(dataset)
myColumns


# Irei renomear as colunas para facilitar o trabalho posterior
myColumns[1] <- "NomePais"
myColumns[2] <- "Ano"
myColumns[3] <- "IndicadorNivelVida"
myColumns[4] <- "PIB_per_capita"
myColumns[5] <- "SuporteSocial"
myColumns[6] <- "ExpectativaVida"
myColumns[7] <- "IndicadorLiberdade"
myColumns[8] <- "IndicadorGenerosidade"
myColumns[9] <- "IndicadorCorrupcao"
myColumns[10] <- "IndicadorEmocoesPositivas"
myColumns[11] <- "IndicadorEmocoesNegativas"


# Verificando 
myColumns


# Atribuindo os novos nomes ao dataframe
colnames(dataset) <- myColumns
rm(myColumns)

View(dataset)


# Verificando quantos países foram incluídos no dataset
length(unique(dataset$NomePais))
## Ou seja, temos 166 países diferentes listados no conjunto de dados


# Listando os países únicos e gravando o resultado (antes de remover registros com valores NA)
list_countries_with_na <- unique(dataset$NomePais)
list_countries_with_na
# ou seja, esses são os países que contém valores NA



# Eliminando linhas com valores NA
dataset <- na.omit(dataset)


# Dimensões
dim(dataset)


# Lista de países após remover os valores NA
list_of_countries_without_na <- unique(dataset$NomePais)
list_of_countries_without_na


# Verificando se perdi algum país após a remoção
length(list_countries_with_na)
length(list_of_countries_without_na)
## Note que perdemos 11 países após a remoção dos valores NA


# Verificando a diferença entre antes e depois da remoção dos NA
setdiff(list_countries_with_na, list_of_countries_without_na)


# Remove os objetos 
rm(list_countries_with_na)
rm(list_of_countries_without_na)


# Verificando quais anos estão presentes no dataset
anos <- unique(dataset$Ano)
range(anos)
length(unique(dataset$Ano))
rm(anos)


# Número de registros por ano
table(dataset$Ano)


# Vamos remover os anos com menor contribuição (menor volume de dados)
dados_por_anos <- dataset[dataset$Ano!= 2005 & dataset$Ano!= 2006 & dataset$Ano!= 2007 & dataset$Ano!= 2020, ]
## OBS: escolhi remover os anos com valores abaixo de 100 observações, e a função acima basicamente está removendo os 
## anos aos quais escolhi, de todas as colunas.


# Número de registros por ano
table(dados_por_anos$Ano)


# Extraindo as variáveis numéricas
numeric_variable_list <- sapply(dataset, is.numeric)
numerical_data <- dataset[numeric_variable_list]


# Matriz de correlação
cor(numerical_data)


# Correlation Plot
pairs(numerical_data)
pairs(numerical_data[1:5], labels = colnames(numerical_data[1:5]))
pairs(numerical_data[6:10], labels = colnames(numerical_data[6:10]))
