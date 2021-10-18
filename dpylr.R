#Limpando o ambiente caso haja algum objeto já carregado
rm(list=ls())

#Carregando as bibliotecas
pacman::p_load(pacman, readr, dplyr, tidyr, stringr)

#Lendo o arquivo
ENEM <- read_csv("C:/Users/victor.resende/Desktop/Victor Estagio/Amostras/Nova pasta/AmostraVictorResende.csv")

#Visualizando a base de dados
View(ENEM)

#Arrumando erro de notacao cientifica nos graficos
options("scipen"=100, "digits"=4)

################################################################################

#Filtrando os dados de cada anos
ENEM2017 <- 
  ENEM %>%
    filter(NU_ANO == 2017)
#Ou:
ENEM2019 <- filter(ENEM, NU_ANO == 2019)
ENEM2018 <- filter(ENEM, NU_ANO == 2018)
ENEM2017 <- filter(ENEM, NU_ANO == 2017)

#Selecionando algumas variaveis e filtrando para estado ACRE
ACRE <-
  ENEM %>%
    filter(SG_UF_RESIDENCIA == 'AC') %>%
    select(Sexo:NOTA_MEDIA)

#Criando colunas novas
#Comparando notas medias criada pelo SAS e agora pelo R
ENEM_NOTAS_MEDIAS <- 
  ENEM %>%
    select(NU_NOTA_CN:NOTA_MEDIA) %>%
    mutate(NOTA_MEDI1 = (NU_NOTA_MT + NU_NOTA_LC + NU_NOTA_CH + NU_NOTA_CN + 
                         NU_NOTA_REDACAO)/5)%>%
    arrange(desc(NOTA_MEDI1))#Arranjando em ordem decrescente
    
#Criando amostra
ENEM_AMOSTRA <- 
  ENEM%>%
  sample_n(6000, replace = TRUE)

#Colhendo valores distintos
ENEM_SEXO <-
  ENEM %>%
  distinct(Sexo)


#Imputacao de dados ausentes - Dplyr

#Qualitativos Exemplo Cor e Raca
ENEM <- 
  ENEM %>% 
  mutate(COR_RACA = ifelse(is.na(COR_RACA), 'Não declarado', COR_RACA))

#Quantitativos Exemplo Notas
ENEM <-
  ENEM%>%
  mutate(NU_NOTA_CH = ifelse(is.na(NU_NOTA_CH), median(NU_NOTA_CH, na.rm = TRUE), NU_NOTA_CH),
         NU_NOTA_CN = ifelse(is.na(NU_NOTA_CN), median(NU_NOTA_CH, na.rm = TRUE), NU_NOTA_CN),
         NU_NOTA_LC = ifelse(is.na(NU_NOTA_LC), median(NU_NOTA_LC, na.rm = TRUE), NU_NOTA_LC),
         NU_NOTA_MT = ifelse(is.na(NU_NOTA_MT), median(NU_NOTA_MT, na.rm = TRUE), NU_NOTA_MT),
         NU_NOTA_REDACAO = ifelse(is.na(NU_NOTA_REDACAO), median(NU_NOTA_REDACAO, na.rm = TRUE), NU_NOTA_REDACAO)
         )





