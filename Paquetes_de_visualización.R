##### Librerías avanzadas basadas en ggplot2

Estudiantes <- read.csv(file.choose(),header=TRUE,sep=";")
attach(Estudiantes)
View(Estudiantes)
names(Estudiantes)

# Paquete necesario:
install.packages("ggplot2")
library(ggplot2)

#### GGally
install.packages("GGally")
library(GGally)

# Aplicación:

ggpairs(Estudiantes[,c("age","sex","guardian")])

ggpairs(Estudiantes[,c("age","sex","guardian")],
        axisLabels = "internal")

#### esquisse

# Paquetes necesarios
install.packages("esquisse")
install.packages("shiny")
install.packages("promises")
library(promises)
library(shiny)
library(esquisse)

options("esquisse.viewer" = "browser")
esquisse::esquisser()






