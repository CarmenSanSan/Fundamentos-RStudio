positivo <- function(x){if (x>0) 
  print("positivo")
  else print("negativo o cero")}
positivo(9)

negativo <- function(x){if (x<0)
  print("negativo")
  else print("positivo")}
negativo (-2)
negativo (1)


library(readxl)
datos_50 <- file.choose()
Base_datos_50 <-read.csv(datos_50)

SinNA <- na.omit(Base_datos_50)
sum(SinNA$sulfate)
sum(SinNA$nitrate)