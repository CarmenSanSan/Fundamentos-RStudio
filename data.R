v1 <-c(18:37)
Marzo <- matrix(v1, nrow = 5, ncol = 4)

v2 <- c(20:39)
Abril <- matrix(v2, nrow = 5, ncol = 4)

v3 <- c(25:44)
Mayo <- matrix(v3, nrow = 5, ncol = 4)

v4 <- c(30:49)
Junio <- matrix(v4, nrow = 5, ncol = 4)

familia <- c("Agelenidae", "Araneidae", "Ctenidae", "Lycosidae", "Thomisidae")
semanas <- c("Semana 1", "Semana 2", "Semana 3", "Semana 4")

Arañas <- array(c(Marzo, Abril, Mayo, Junio), dim = c(5,4,4), dimnames = list(familia, semanas))
Arañas

#Datos de Abril
Arañas [,,2]
#Datos de Araneida, semana 3 de Marzo
Arañas [2,3,1]
#Datos de Ctenidae
Arañas[3,,c(1:4)]
Arañas[3,,c(1:2)]
Arañas[3,2,c(1:2)]

#DATA FRAME####
V1 <- c(59,0,22)