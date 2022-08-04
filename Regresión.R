# Modelo de Regresión Lineal Múltiple

Estudiantes <- read.csv(file.choose(),header=TRUE,sep=";")
attach(Estudiantes)
View(Estudiantes)
names(Estudiantes)

# Eliminaremos las vairables G1,G2 y G3
Estudiantes$G1<-NULL
Estudiantes$G2<-NULL
Estudiantes$G3<-NULL
View(Estudiantes)

# Modelo de regresión para absence en función del resto de variables:
modelo_tot <- lm(absences~., data = Estudiantes)
modelo_tot
summary(modelo_tot)

install.packages("car")
library(car)
vif(modelo_tot)
help(vif)
step(modelo_tot)
