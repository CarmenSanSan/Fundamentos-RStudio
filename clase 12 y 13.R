library(tidyverse)
library(readxl)
Aves <- file.choose()
Aves_de_México <- read_xlsx(Aves, na = c("NA", "Na"))
Aves_de_México <- Aves_de_México %>%
  mutate(Residencia = case_when(Residencia == "R" ~ "Residente",
                                Residencia == "MI" ~ "Migratoria de invierno",
                                Residencia == "A" ~ "Accidental",
                                Residencia == "MV" ~ "Migratoria de verano",
                                Residencia == "Mv" ~ "Migratoria de verano",
                                Residencia == "T" ~ "Transitoria"))

Aves_de_México <- Aves_de_México %>% 
  rename("NOM_059" = "NOM-059",
         "Valor de vulnerabilidad" = "VV",
         "Origen y categoría de endemismo" = "END/EX",
         "Categoría UICN" = "UICN") 
Aves_de_México <- Aves_de_México %>% 
  rename("NOM_059" = "NOM_059",
         "Valor_de_vulnerabilidad" = "Valor de vulnerabilidad",
         "Origen_y_categoría_de_endemismo" = "Origen y categoría de endemismo",
         "Categoría_UICN" = "Categoría UICN") 

Aves_de_México <- Aves_de_México %>% 
  mutate(NOM_059 = case_when(NOM_059 == "A" ~ "Amenazada",
                             NOM_059 == "Pr" ~ "Sujeta a protección especial",
                             NOM_059 == "sc" ~ "Sin categoría",
                             NOM_059 == "E" ~ "Probablemente extint en el medio silvestre",
                             NOM_059 == "P" ~ "Peligro de extinción"))

Aves_de_México <- Aves_de_México %>% 
  mutate(Categoría_UICN = case_when(Categoría_UICN == "NT" ~ "Casi amenazado",
                                    Categoría_UICN == "LC" ~ "Preocupación menor",
                                    Categoría_UICN == "VU" ~ "Vulnerable",
                                    Categoría_UICN == "EN" ~ "En peligro",
                                    Categoría_UICN == "EX" ~ "Extinto",
                                    Categoría_UICN == "EW" ~ "Extinto en medio silvestre",
                                    Categoría_UICN == "DD" ~ "Datos insuficientes",
                                    Categoría_UICN == "CR" ~ "En peligro crítico"))

Aves_de_México <- Aves_de_México %>% 
  mutate(Origen_y_categoría_de_endemismo = case_when(Origen_y_categoría_de_endemismo == "NE" ~ "No evaluado",
                                                     Origen_y_categoría_de_endemismo == "EN" ~ "Endémica",
                                                     Origen_y_categoría_de_endemismo == "CE" ~ "Cuasiendémica",
                                                     Origen_y_categoría_de_endemismo == "Exo" ~ "Exótica",
                                                     Origen_y_categoría_de_endemismo == "SE" ~ "Semiendémica"))
glimpse(Aves_de_México)
Aves_de_México <- Aves_de_México %>% 
  mutate(Tamaño_promedio = c(`Male size cm` + `Female size`)/2)
Aves_de_México <- Aves_de_México %>% 
  mutate(Promedio_ala = c(`Wingspan Male` + `Wingspan Female`)/2)
Aves_de_México <- Aves_de_México %>% 
  mutate(Promedio_puesta = c(`Minimun clutch size` + `Maximum clutch size`)/2)

Fem <- Aves_de_México %>% 
  select(Familia, `Female size`, Promedio_puesta, `Wingspan Female`)
Migratoria_ala <- Aves_de_México %>% 
  select(Orden, Familia, Género, Especie, Residencia, Promedio_ala)
Migratoria_ala <- Migratoria_ala %>% 
  filter(Residencia %in% c("Migratoria de verano", "Migratoria de invierno"))
Fam_cat <- Aves_de_México %>% 
  group_by(Categoría_UICN) %>% 
  summarise(No = n_distinct(Familia))
Size_Wingspan <- Aves_de_México %>% 
  select(Orden, Familia, Especie, Residencia, Tamaño_promedio, Promedio_ala)

Fam_059 <- Aves_de_México %>% 
  group_by(NOM_059) %>% 
  summarise(No = n_distinct(Familia))
Gen_059 <- Aves_de_México %>% 
  group_by(NOM_059) %>% 
  summarise(No = n_distinct(Género))
Esp_059 <- Aves_de_México %>% 
  group_by(NOM_059) %>% 
  summarise(No = n_distinct(Especie))
