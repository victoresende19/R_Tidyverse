#Limpando o ambiente caso haja alguma variavel carregada
rm(list=ls())

################################################################################
#Carregando as bibliotecas
pacman::p_load(pacman, readr, dplyr)

################################################################################
#Criando filtro de variaveis para variaveis selecionadas
Filtro <- c('NU_ANO', 'CO_UF_PROVA', 'IN_PROVA_CH', 'IN_PROVA_CN',
            'IN_PROVA_LC', 'IN_PROVA_MT', 'NO_ENTIDADE_CERTIFICADORA',
            'NU_IDADE', 'NU_INSCRICAO', 'SG_UF_PROVA', 'TP_CERTIFICACAO',
            'TP_SEXO')

#Abrindo arquivos com variaveis presente no filtro
ENCEJA.2019 <- read_csv("encceja.2019.csv", locale = locale(encoding = "WINDOWS-1252"),
                        col_select = Filtro)

ENCEJA.2018 <- read_csv("encceja.2018.csv", locale = locale(encoding = "WINDOWS-1252"),
                        col_select = Filtro)

ENCEJA.2017 <- read_csv("encceja.2017.csv", locale = locale(encoding = "WINDOWS-1252"),
                        col_select = Filtro)


#Empilhando os anos
ENCEJA.consolidado <- bind_rows(ENCEJA.2019, ENCEJA.2018, ENCEJA.2017)

#Exportando dados para csv
write.csv(ENCEJA.consolidado, "ENCEJA_consolidado.csv")
