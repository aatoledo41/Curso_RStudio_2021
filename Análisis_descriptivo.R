######## Seleccionar base de datos: 

Estudiantes <- read.csv(file.choose(),header=TRUE,sep=";")
## file.choose() evita escribir la ruta del archivo, abre la ventana de búsqueda
## header=TRUE indica que tiene encabezado
## sep=";" indica que el separador es ";", el separador habitual es ","
## Observación: si fuera .txt : read.table(file.choose(),header=TRUE)

 
attach(Estudiantes) 
head(Estudiantes) # lectura de la sprimeras 6 filas incluido encabezado
names(Estudiantes) # nombre de las variables
str(Estudiantes) # Estructura de las variables (int, factor, ...)
help(str) # Ayuda
View(Estudiantes) # Visualización como planilla de datos


######## Análisis univariado de los datos:

### Mjob (Mother's job): variable cualitativa
table(Estudiantes$Mjob) # permite tabular
table(Mjob)
table(Estudiantes$Fjob) # Fjob (Father's job)
View(table(Fjob))

prop.table(table(Estudiantes$Mjob)) # tabla de proporciones

# Gráfico de barras:
barplot(table(Estudiantes$Mjob)) 
help("barplot")
barplot(table(Estudiantes$Mjob),
        main = "Trabajo de la madre",
        xlab = "Mjob",
        ylab = "Frecuencias",
        col = 1:5)


# Gráfico de torta:
pie(table(Estudiantes$Mjob),col=1:5,main = "Trabajo de la madre")
help(pie)


### Variable edad (age)

table(cut(age,4)) # tabla de contingencia 
View(table(cut(age,4)))
prop.table(table(cut(age,4))) 

# Histograma:
hist(age)
table(age)
hist(G1)
help(hist)
hist(G1,
     main = "Calificación del primer periodo",
     ylab = "Frecuencia",
     col = "steelblue")

# Para agregar función de densidad estimada se debe cambiar la opción frequency a FALSE:
hist(G1,main="Calificación del primer periodo",
     col="steelblue"
     ,xlab="G1",ylab="Frecuencia"
     ,freq=FALSE)
lines(density(G1),col="red")
# obs: para gráficar lines se debe dejar
# freq=FALSE en el histograma

### ¿Cómo podemos segmentar age en función de guardian (tutor)?
age_m<-age[guardian=="mother"]
age_f<-age[guardian=="father"]
age_o<-age[guardian=="other"]

age_f
View(age_f)

### ¿Estadística básica de los datos?
summary(age)
var(age) # varianza
sd(age) # desviación estándar 
sqrt(var(age))

library(moments)
skewness(age) # coeficiente de asimetría
kurtosis(age) # coeficiente de curtosis (obs: criterio centrado en 3)

# Resumen de edades por niveles de la variable guardian
summary(age_m)
summary(age_f)
summary(age_o)

help("hist")
hist(age, breaks = seq(14,22,by=1),
     main = "Histograma de edades",
     xlab = "Edad",
     ylab = "Frecuencia",
     ylim = c(0,120))


### ¿Cómo se pueden hacer histogramas superpuestos para comparar age por guardian?
hist(age_m,breaks=seq(14,22,by=1),col=rgb(1,0,0,0.8)
     ,xlim=c(14,22),ylim = c(0,120), xlab="Edad",
     ylab="Frecuencia",main = "Histograma")
hist(age_f,breaks=seq(14,22,by=1),col=rgb(0,0,1,0.6)
     ,xlim=c(14,22), ylim = c(0,120),add=T)
hist(age_o,breaks=seq(14,22,by=1),col=rgb(0,1,0,0.4)
     ,xlim=c(14,22),ylim = c(0,120),add=T)

legend("topright", legend=c("guardian: mother", "guardian: father", "guardian: other"),
    box.lty=0,cex=0.8,fill=c(rgb(1,0,0,0.8), rgb(0,0,1,0.6),rgb(0,1,0,0.4)))

par(mfrow=c(1,1))


#### ¿ y si quiero los gráficos separados en la misma pantalla?

par(mfrow=c(1,3))
hist(age_m,breaks=seq(14,22,by=1),col=rgb(1,0,0,0.8)
     ,xlim=c(14,22), ylim = c(0,120),
     xlab="age", main = "Histograma \n guadian: mother")

hist(age_f,breaks=seq(14,22,by=1),col=rgb(0,0,1,0.6)
     ,xlim=c(14,22), ylim = c(0,120),
     xlab="age", main = "Histograma \n guadian: father")

hist(age_o,breaks=seq(14,22,by=1),col=rgb(0,1,0,0.4)
     ,xlim=c(14,22),ylim = c(0,120),
     xlab="age", main = "Histograma \n guadian: other")


#### Para regresar a la pantalla gráfica original (1 X 1)
par(mfrow=c(1,1))

######## DESAFÍO 1 ########
# Generar tablas de frecuencias y gráficos respectivos para las variables restantes:


######## Diagrama de caja y extensión
boxplot(goout,col="gray",xlab="going out with friends",
        horizontal = TRUE )
summary(goout)
help("boxplot")

boxplot(age, horizontal = TRUE )

boxplot(age~guardian,col=c("red","blue","green"),
        xlab="age", horizontal=TRUE)

######## DESAFÍO 2 ########
# Realizar diagrama de caja para otras variables cuantitativas restantes en función de guardian (tutor)
# Condicione respecto a otras variables cualitativas







