titulo_pelicula <- "The Shining"
reparto_pelicula <- c("Jack Nicholson", "Shelley Duvall", "Danny Lloyd", "Scatman Crothers", "Barry Nelson")


lista_TS <- list (Titulo = "The Shining",
                  Reparto = c("Jack Nicholson", "Shelley Duvall", "Danny Lloyd", "Scatman Crothers", "Barry Nelson"))
lista_TS



Temperatura <- c(13.9, 14.8, 16.4, 18, 19.1, 18.6, 17.5, 17.9, 17.7, 16.7, 15.7, 14.6)
Precipitacion <- c(22.7, 8, 5.4, 5.5, 34.2, 145.4, 195.9, 185.1, 130.1, 62.8, 9.7, 9.1)

Datos_1 <- cbind(Temperatura, Precipitacion)
Datos_1

Datos_2 <- rbind(Temperatura, Precipitacion)
Datos_2

Datos_3 <- matrix(Temperatura, Precipitacion,
                  nrow = 12,
                  ncol = 2)
Datos_3

Mes_nombre <- c("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")
Columnas <- c("Temperatura", "Precipiacion")
colnames(Datos_3) <- c(Columnas)
rownames(Datos_3) <- c(Mes_nombre)
Datos_3 
list(matriz=Datos_3, Meses=Mes_nombre)
