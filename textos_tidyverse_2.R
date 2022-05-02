
# Trabalhando com textos - Tidyverse -------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data do script: 30/04/22 -----------------------------------------------------------------------------------------------------------------
# Referência: Curso Udemy ------------------------------------------------------------------------------------------------------------------

# Pacotes necessário ------------------------------------------------------------------------------------------------------------------------

library(tidyverse)
library(tidytext) # Pacote para análise de textos
library(tm) # Pacote para text mining
library(wordcloud) # Nuvem de palavras

# Carregando texto -------------------------------------------------------------------------------------------------------------------------

casmurro <- scan("casmurro.txt", what = "character", sep = "\n", encoding = "UTF-8")

# Manipulando o texto ----------------------------------------------------------------------------------------------------------------------

casmurro[1:30] # Início do texto, até as 30 primeiras linhas.
grep("FIM", casmurro) # Procura a palavra "fim" no texto

casmurro[27:6393] # Linha onde começa o capítulo até o fim do texto

stopwords("pt") # Indica algumas palavras em português ("pt") que não tem muita utilidade 
## para as análises

casmurro <- removeWords(casmurro, stopwords("pt")) # Remove palavras desnecessárias

# Análise do texto - Mineração -------------------------------------------------------------------------------------------------------------------------

grep("Bentinho", casmurro) # Posições onde está a palavra "Bentinho"

length(grep("Bentinho", casmurro)) # Quantas vezes são citadas as palavras
length(grep("Capitú", casmurro))

# Análise do texto - Tidytext --------------------------------------------------------------------------------------------------------------

casmurro <- data.frame("Linha" = 1:length(casmurro), "Texto" = casmurro)
view(casmurro)

casmurro <- unnest_tokens(casmurro, Palavra, Texto) # Coluna palavra substitui coluna 
# texto
view(casmurro)

## Frequência de palavras

freq <- casmurro %>%
  count(Palavra, sort = TRUE)
view(freq)

## As 100 palavras mais frequentes

freq100 <- filter(freq, n > 100) %>%
  arrange(desc(n))
view(freq100)

# Gráfico de frequência --------------------------------------------------------------------------------------------------------------------

ggplot(freq100) +
  geom_col(aes(x = Palavra, y = n))

ggplot(freq100) +
  geom_col(aes(y = n, x = reorder(Palavra, -n)), fill = "Steelblue") +
  labs(y = "Frequência", x = "Palavras do livro Dom Casmurro") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Nuvem de palavras ------------------------------------------------------------------------------------------------------------------------

wordcloud::wordcloud(freq$Palavra, freq$n, min.freq = 100)             
