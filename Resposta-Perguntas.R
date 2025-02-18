##### Análise Exploratória de Dados - Resposta às Perguntas de Negócio #####

##### Parte 2 - Plots e Estatísticas #####

# Dados
colnames(df_medias)
View(df_medias)
str(df_medias)


# Pergunta 1 
# O aumento do PIB per capita de um país afeta positivamente a expectativa de vida dos cidadãos ao nascer ?
# Qual a correlação entre essas duas variáveis ? 

plot(df_medias$PIB_per_capita, df_medias$ExpectativaVida,
     xlab = "Média do PIB per Capita",
     ylab = "Média da Expectativa de vida",)

cor.test(df_medias$PIB_per_capita, df_medias$ExpectativaVida, method = 'pearson')



# Resposta: Podemos ver no gráfico de dispersão que a medida que o PIB per capita do país aumenta, temos um aumento na 
# expectativa de vida, assim concluímos que o PIB do país afeta positivamente a expectativa de vida dos cidadãos ao nascer.
# Além disso, a correlação entre as duas variáveis é de aproximadamente 85%

#------------------------------------------------------------------------------#

# Pergunta 2 
# Existe uma correlação entre a escala de vida e a conscientização do público em geral sobre a corrupção nos negócios e no governo ?
# Qual a correlação entre essas duas variáveis ?

plot(df_medias$IndicadorNivelVida, df_medias$IndicadorCorrupcao,
     xlab = "Escala de vida",
     ylab = "Percepção de Corrupção")

cor.test(df_medias$IndicadorNivelVida, df_medias$IndicadorCorrupcao, method = 'pearson')

# Resposta: Observamos que há uma correlação negativa entre o Indicador do Nível de vida e o Indicador de corrupção nos negócios e 
# governo, ou seja, quanto maior o Nível de Vida, menor é a percepção sobre a corrupção nos negócios e no governo. 
# A correlação é aprox. -46%.

#------------------------------------------------------------------------------#

# Pergunta 3 
# O aumento na escala de vida tem alguma efeito na média de felicidade entre o público em geral ? 
# Qual a correlação entre essas duas variáveis ?
plot(df_medias$IndicadorNivelVida, df_medias$IndicadorEmocoesPositivas,
     xlab = "Escala de Vida",
     ylab = "Felicidade")
cor.test(df_medias$IndicadorNivelVida, df_medias$IndicadorEmocoesPositivas, method = 'pearson')

# Resposta: O aumento na escala de vida tem efeito positivo na média de felicidade do público,
# isto é, a medida que o nível de vida aumenta, temos que a média da felicidade em geral também
# aumenta. Com índice de correlação de 57%

#------------------------------------------------------------------------------#

# Pergunta 4
# O país com menor índice de suporte social tem maior percepção de corrupção em relação 
# às empresas e ao governo no país ? 

df_medias[df_medias$SuporteSocial == min(df_medias$SuporteSocial),]
df1 <- df_medias[df_medias$NomePais == "Central African Republic",]
View(df1)
df1$SuporteSocial
df1$IndicadorCorrupcao
max(df_medias$SuporteSocial)
max(df_medias$IndicadorCorrupcao)

df_medias[df_medias$SuporteSocial == max(df_medias$SuporteSocial),]
df2 <- df_medias[df_medias$NomePais == "Iceland",]
df2$SuporteSocial
df2$IndicadorCorrupcao

cor.test(df_medias$SuporteSocial, df_medias$IndicadorCorrupcao, method = 'pearson')


# Resposta: Observe que o país que corresponde ao menor nível de suporte social possui o índice de
# percepção de corrupção maior que o país que corresponde ao maior índice social, isso é comprovado
# pelo baixo índice de correlação entre essas variáveis, próximo de -26%.
# Ademais, o índice de percepção de corrupção do país com menor suporte social é muito próximo do
# maior valor para o índice de percepção.


#------------------------------------------------------------------------------#

# Pergunta 5
# Pessoas generosas são mais felizes ?

plot(df_medias$IndicadorGenerosidade, df_medias$IndicadorEmocoesPositivas)
cor.test(df_medias$IndicadorGenerosidade, df_medias$IndicadorEmocoesPositivas, method = 'pearson')

# Resposta:
# Podemos dizer que há correlação positiva entre o indicador de generosidade e emoções positivas
# correlação de aprox. 40%. 



# Fim.