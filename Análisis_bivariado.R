######## Análisis bivariado de datos:
Estudiantes <- read.csv(file.choose(),header=TRUE,sep=";")
attach(Estudiantes)
View(Estudiantes)
names(Estudiantes)

######## Tabla de doble entrada
# guardian vs studytime:
table(guardian,studytime)
# guardian: father, mother, other
# studytime: 1:<15 min., 2: 15 a 30 min., 3: 30 min a 1 hora, o 4: > 1 hora
View(table(guardian,studytime))

# Tabla de probabilidades:
# Las proporciones se determinan respecto al total general
prop.table(table(guardian,studytime))
# Las proporciones se determinan respecto a los totales fila
prop.table(table(guardian,studytime),1)
# Las proporciones se determinan respecto a los totales columna
prop.table(table(guardian,studytime),2)

# age: edad 
table(cut(age,3),famrel)
# famrel - calidad de las relaciones familiares (numérico: de 1 - muy mala a 5 - excelente)

# Gráfico de mosaico:
mosaicplot(studytime~guardian, main = "Gráfico de mosaico")
table(guardian,studytime)

######## Gráfico de dispersión:

plot(G1,G2, main = "Gráfico de dispersión", 
     col="blue") 
help("plot")

pairs(cbind(G1,G2))
cor(G1,G2) #correlación de Pearson

## ¿Qué ocurre si tengo 3 o más variables?
pairs(cbind(G1,G2,absences))
cor(cbind(G1,G2,absences))

# Regresando al problema anterior:
# filtrando los valores 0:
G1_f<-G1[G2>0]
G2_f<-G2[G2>0]
plot(G1_f,G2_f, main ="Gráfico de dispersión (con filtro)")
cor(G1_f,G2_f) #correlación de Pearson

# comparación de dos gráficos de dispersión:
par(mfrow=c(1,2))
plot(G1,G2,main = "Gráfico de dispersión")
plot(G1_f,G2_f,main = "Gráfico de dispersión (con filtro)")

## si se quiere añadir recta de regresión lineal:
par(mfrow=c(1,1))
plot(G1_f,G2_f)
linear<-lm(G2_f~G1_f)
linear
abline(linear, col="green")
# resumen:
summary(linear)

#### DESAFÍO ####
## Analizar las varible age (3 intervalos) y absences (5 intervalos) mediante:
# Tabla de contingencia (considerar los intervalos mencionados)
## con las mismas variables pero sin tabular. Determine:
# Gráfico de dispersión 
# Cálculo de correlación de Pearson
# Ajuste de recta de regresión
# Estimación de parámetros de regresión




