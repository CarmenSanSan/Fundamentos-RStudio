library(readxl)
Ciclo_Tro <- file.choose()
Ciclones_tropicales <- read_xlsx(Ciclo_Tro)
Ciclones_tropicales$`Fecha de inicio` <- as.Date(Ciclones_tropicales$`Fecha de inicio`,
                                                format = "%d.%m.%y")
Ciclones_tropicales$`Fecha de termino` <- as.Date(Ciclones_tropicales$`Fecha de termino`,
                                                  format = "%d.%m.%y")
library(tidyverse)

#Renombrar las categorías##
Ciclones_tropicales <- Ciclones_tropicales %>% 
  mutate(Categoria = case_when(Categoria == "TT" ~ "Tormenta Tropical",
                               Categoria == "DT" ~ "Depresión Tropical",
                               Categoria == "TST" ~ "Tormenta sub Tropical",
                               Categoria == "H1" ~ "Huracán Categoría 1",
                               Categoria == "H2" ~ "Huracán Categoría 2",
                               Categoria == "H3" ~ "Huracán Categoría 3",
                               Categoria == "H4" ~ "Huracán Categoría 4",
                               Categoria == "H5" ~ "Huracán Categoría 5"))
