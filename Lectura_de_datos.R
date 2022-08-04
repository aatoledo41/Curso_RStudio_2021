##### Lectura (ingesta) de datos:
# bases: PelicanStores.csv  y Datos_personas.xlsx

##### Formas de lectura para csv #####
datos<-read.csv(file.choose(),header=TRUE,sep = ";")
attach(datos)
View(datos)
str(datos)
names(datos)
datos
head(datos,3)
tail(datos,3)

#######
PelicanStores


##### Lectura de Excel (xlsx) #####

#install.packages("readxl")

library(readxl)
datos2<-read_xlsx(file.choose())
attach(datos2)
View(datos2)
str(datos2)
datos2$Id<-as.integer(datos2$Id)
str(datos2)

######
Datos_personas
View(Datos_personas)



