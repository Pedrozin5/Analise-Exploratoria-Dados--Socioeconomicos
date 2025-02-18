

##### Análise Exploratória de Dados - Resposta às Perguntas de Negócio #####


##### Parte 1 - Organizando os Dados. #####

# Vamos realizar a análise considerando a média de indicadores por país.
# Calculamos as médias fazendo agrupamento por indicador e concatenamos os dataframes resultantes.

# Visualizando os dados 
View(dataset)

# Nomes das colunas 
colnames(dataset)


# Agrupando os dados e calculando a média por país (PIB per capita por País)
pib_per_capita_pais_media <- dataset %>%
  group_by(NomePais) %>%
  summarise(PIB_per_capita = mean(PIB_per_capita))

# Agrupando os dados e calculando a média por país (Suporte Social por País)
suporte_social_pais_media <- dataset %>%
  group_by(NomePais) %>%
  summarise(SuporteSocial = mean(SuporteSocial))


# Merge dos dataframes
df_medias <- merge(pib_per_capita_pais_media, suporte_social_pais_media)
View(df_medias)
## Perceba que agora temos um dataframe que contém as médias do PIB e do Suporte Social 
## separados por país, faremos isso com as outras variáveis.


# Removendo o que não é mais usado 
rm(pib_per_capita_pais_media)
rm(suporte_social_pais_media)


# Agrupando os dados e calculando a média por país (Indicador do Nível de Vida por País)
ind_nivel_vida_pais_media <- dataset %>%
  group_by(NomePais) %>%
  summarise(IndicadorNivelVida = mean(IndicadorNivelVida))

# Merge
df_medias <- merge(df_medias, ind_nivel_vida_pais_media)
View(df_medias)

rm(ind_nivel_vida_pais_media)


# Agrupando os dados e calculando a média por país (Expectativa de vida por País)
expec_vida_pais_media <- dataset %>%
  group_by(NomePais) %>%
  summarise(ExpectativaVida = mean(ExpectativaVida))

# Merge
df_medias <- merge(df_medias, expec_vida_pais_media)
View(df_medias)

rm(expec_vida_pais_media)


# Agrupando os dados e calculando a média por país (Indicador Liberdade por País)
ind_liberdade_pais_media <- dataset %>%
  group_by(NomePais) %>%
  summarise(IndicadorLiberdade = mean(IndicadorLiberdade))

# Merge
df_medias <- merge(df_medias, ind_liberdade_pais_media)
View(df_medias)

rm(ind_liberdade_pais_media)


# Agrupando os dados e calculando a média por país (Indicador de Generosidade por País)
ind_generosidade_pais_media <- dataset %>%
  group_by(NomePais) %>%
  summarise(IndicadorGenerosidade = mean(IndicadorGenerosidade))

# Merge
df_medias <- merge(df_medias, ind_generosidade_pais_media)

rm(ind_generosidade_pais_media)


# Agrupando os dados e calculando a média por país (Indicador Corrupção por País)
ind_corrupcao_pais_media <- dataset %>%
  group_by(NomePais) %>%
  summarise(IndicadorCorrupcao = mean(IndicadorCorrupcao))

# Merge
df_medias <- merge(df_medias, ind_corrupcao_pais_media)

rm(ind_corrupcao_pais_media)


# Agrupando os dados e calculando a média por país (Indicador de Emoções Positivas por País)
ind_emocoes_positivas_pais_media <- dataset %>%
  group_by(NomePais) %>%
  summarise(IndicadorEmocoesPositivas = mean(IndicadorEmocoesPositivas))

# Merge
df_medias <- merge(df_medias, ind_emocoes_positivas_pais_media)

rm(ind_emocoes_positivas_pais_media)


# Agrupando os dados e calculando a média por país (Indicador de Emoções Negativas por País)
ind_emocoes_negativas_pais_media <- dataset %>%
  group_by(NomePais) %>%
  summarise(IndicadorEmocoesNegativas = mean(IndicadorEmocoesNegativas))

# Merge
df_medias = merge(df_medias, ind_emocoes_negativas_pais_media)

rm(ind_emocoes_negativas_pais_media)

dim(df_medias)



# Agora tenho pronto o dataframe com as médias de cada indicador, separado por país