
# Trabalhando com textos - Tidyverse -------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data do script: 30/04/22 -----------------------------------------------------------------------------------------------------------------
# Referência: Curso Udemy ------------------------------------------------------------------------------------------------------------------

# Pacotes necessário ------------------------------------------------------------------------------------------------------------------------

library(tidyverse)
library(tidytext) # Pacote para análise de textos
library(tm) # Pacote para text mining

# Carregando texto -------------------------------------------------------------------------------------------------------------------------

casmurro <- scan("casmurro.txt", what = "character", sep = "\n", encoding = "UTF-8")

# Manipulando o texto ----------------------------------------------------------------------------------------------------------------------

casmurro[1:30] # Início do texto, até as 30 primeiras linhas.
grep("FIM", casmurro) # Procura a palavra "fim" no texto

casmurro[27:6393] # Linha onde começa o capítulo até o fim do texto

stopwords("pt") # Indica algumas palavras em português ("pt") que não tem muita utilidade 
## para as análises

casmurro <- removeWords(casmurro, stopwords("pt")) # Remove palavras desnecessárias

# Análise do texto -------------------------------------------------------------------------------------------------------------------------

grep("Bentinho", casmurro)
