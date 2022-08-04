###############################
###### Test Estadísticos ######
###############################
Estudiantes <- read.csv(file.choose()
                        ,header=TRUE,sep=";")
attach(Estudiantes)
View(Estudiantes)

######################
### Test de medias para comparar dos poblaciones dependientes
######################
# ¿Hay diferencias significativas en los puntajes 
# promedio de las evaluaciones G1 y G2?
# Confianza: 95% -> significancia : 5%

## Previo 1: variables de estudio
Prueba_1<-Estudiantes$G1[G2>0]
Prueba_2<-Estudiantes$G2[G2>0]
plot(Prueba_1,Prueba_2,main = "Puntajes pruebas")

# Diferencia entre puntajes:
Dif = Prueba_2-Prueba_1
hist(Dif)
summary(Dif)
length(Dif)

## Previo 2: Test de normalidad
# Diagnostico de normalidad:
qqnorm(Dif)
qqline(Dif,col="red")

# Test de normalidad Kolmogorov-smirnov (n>50)
ks.test(Dif,pnorm(mean(Dif),sd(Dif)))
# shapiro.test() (Si n<=50)

# Finalmente:
t.test(Prueba_2,Prueba_1,alternative = "two.sided",
       mu = 0, paired = TRUE,
       conf.level = 0.95)


######################
### Test de medias para comparar dos poblaciones independientes
######################

# ¿Hay diferencias significativas entre los puntajes 
# promedio obtenidos por hombres y mujeres en G1?
# Confianza: 95% ->  significancia: 5%

# Previo 1: Separar variables de estudio
G1_fem<-G1[Estudiantes$sex=="F"]
hist(G1_fem)
summary(G1_fem)
G1_mas<-G1[Estudiantes$sex=="M"]
hist(G1_mas)
summary(G1_mas)

# Previo 2: Test de normalidad
ks.test(G1_fem,pnorm(mean(G1_fem),sd(G1_fem)))
ks.test(G1_mas,pnorm(mean(G1_mas),sd(G1_mas)))

# Previo: Test de homogeneidad de varianzas
boxplot(Estudiantes$G1~Estudiantes$sex)
var(G1_fem)
var(G1_mas)

var.test(G1_mas,G1_fem)
# Se asume igualdad de varianzas poblacionales

#Finalmente:
t.test(G1_fem,G1_mas,
       alternative = "two.sided",
       mu = 0, paired = FALSE, var.equal = TRUE,
       conf.level = 0.95)


######################
### ANOVA (ANDEVA) de un factor
######################

# ¿Hay diferencias significativas entre los puntajes 
# promedio de G1 para los estudiantes respecto a guadian?
# Confianza: 95% ->  significancia: 5%

anova_tutor<-aov(G1~guardian)
summary(anova_tutor)
boxplot(G1~guardian)

######################
### Test chi-cuadrado de independencia
######################
#¿Hay independencia entre la variable guardian
# y la variable activities?

# activities: actividades extracurriculares (yes-no)
t1<-table(guardian,activities)
t1
chisq.test(t1,simulate.p.value = TRUE)


