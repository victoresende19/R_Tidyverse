#Lipando ambiente
rm(list=ls())

#install.packages('purrr')
#install.packages('stringr')

pacman::p_load(pacman, readr, dplyr, tidyr, stringr, purrr, ggplot2)

classical <- read_csv("musicnet_metadata.csv")
View(classical)
summary(classical)

#Excluindo colunas inuteis
classical$id <- NULL
classical$transcriber <- NULL

#Trocando o tipo dos dados
classical$composition <- as.factor(classical$composition)
classical$movement <- as.factor(classical$movement)
classical$ensemble <- as.factor(classical$ensemble)
classical$source <- as.factor(classical$source)
classical$catalog_name <- as.factor(classical$catalog_name)

#Criando novas features
classical$minutes <- round(classical$seconds/60, 2)

#Purr para extração e criação de novas features
classical$instrument <- str_extract(classical$ensemble, 
                                    "Piano|String|Wind|Clarinet|Cello|Violin|Viola|Flute")

classical$composition_type <- str_extract(classical$composition, 
                                         "Sonata|Suite|Impromptus|Serenade")



