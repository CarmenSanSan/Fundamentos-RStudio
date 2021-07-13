library(readxl)
Base_de_datos_ToxinasB <- file.choose()
Elapidae <- read_xlsx(Base_de_datos_ToxinasB, na= "NA")
Viperinae <- read_xlsx(Base_de_datos_ToxinasB, sheet = 2, na= "NA")
Crotalinae <- read_xlsx(Base_de_datos_ToxinasB, sheet = 3, na="NA")

library(tibble)
library(tidyverse)

#Revisar datos##
glimpse(Elapidae)
Elapidae <- Elapidae %>% 
  rename("Three Finger Toxins" = "3FT", 
         "Total de veneno" = "%WV")

#Data frame de Naja de la fam Elapidae
Naja_Elapidae <- Elapidae %>% 
  filter(Género == "Naja")



#Sumatoria de LAAO generales
sum(Elapidae$LAAO)
sum(is.na(Elapidae$LAAO))

#Función select
Componentes_principales <- Elapidae%>% 
  select(PLA2)
Compo_prin <- Elapidae %>% 
  select(No.:SVMP)
Compo_prin_Vi <- Viperinae %>% 
  select(No.:SVMP)
Compo_prin_Cro <- Crotalinae %>% 
  select(No.:SVMP)
Sin_una_columna <- Elapidae %>% 
  select(-PLA2)
Fosfo <- Elapidae %>% 
  select("Fosfolipasas A2" = "PLA2") #no tan reecomendable

#promedio toxina exclusiva de la subfam y del género
Toxin_excl <- Elapidae %>% 
  select(`Three Finger Toxins`) %>% summarise(mean(`Three Finger Toxins`))
Elapidae %>% 
  summarise(mean(`Three Finger Toxins`))

Toxin_excl_Naja <- Naja_Elapidae %>% 
  select(`Three Finger Toxins`) %>% summarise(mean(`Three Finger Toxins`))
Naja_Elapidae %>% 
  summarise(mean(`Three Finger Toxins`))

#Filtrar por proporcion de toxina
solo_TFT <- Elapidae %>% 
  select(`Three Finger Toxins`)
Prop_toxina <- Elapidae %>% 
  select(`Three Finger Toxins`) %>% filter(`Three Finger Toxins`>30, `Three Finger Toxins`<70)
Elapidae %>% 
  filter(`Three Finger Toxins`>30, `Three Finger Toxins`<70) 

Prop_toxin_Naja <- Naja_Elapidae %>% 
  select(`Three Finger Toxins`) %>% filter(`Three Finger Toxins`>30, `Three Finger Toxins`<70)
Naja_Elapidae %>% 
  filter(`Three Finger Toxins`>30, `Three Finger Toxins`<70)


#Unir DatasFrames
Componentes_prin_B <- Compo_prin %>% 
  full_join(Compo_prin_Cro, by = c("No.", "Género", "Especie", "PLA2", "SVSP", "SVMP"))
Componentes_Prin_A <- Componentes_prin_B %>% 
  full_join(Compo_prin_Vi, by = c("No.", "Género", "Especie", "PLA2", "SVSP", "SVMP"))


library(readxl)
Aves <- file.choose()
Aves_de_México <- read_xlsx(Aves, na = c ("NA", "Na"))
Aves_de_México <-Aves_de_México %>% 
  mutate(Residencia = case_when(Residencia == "R" ~ "Residente",
                   ``           Residencia == "MI" ~ "Migratoria de invierno",
                                Residencia == "A" ~ "Accidental",
                                Residencia == "MV" ~ "Migratoria de verano",
                                Residencia == "Mv" ~ "Migratoria de verano",
                                Residencia == "T" ~ "Transitoria"))

