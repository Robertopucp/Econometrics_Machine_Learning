##En una simulación conocemos el proceso generador de datos
## el clear all de R
rm(list=ls())
set.seed(1)  ## seteando un lugar de inicio
## Este comando genera 201 datos de la variable X
X <- seq(from = 0, to = 20, by = 0.1)
## Usando X generamos nuestros Data Generation Model DGM
dgm <- 500 + 20*X - 90*sin(X) #Nuestro DGM
y = dgm + rnorm(length(X), mean = 10, sd = 100)
## juntamos ambas variables en un mismo data frame
data = data.frame(y,X)
str(data)
### Este es el verdadero modelo generador de datos (linea Roja)
plot(X, y, col='deepskyblue4',xlab='X', main='Datos & DGM')
lines(X, dgm, col='firebrick1', lwd=4)

### Objetivos de la Simulación############
### Pretender que no conocemos el DGM (linea roja) sino solo 
### los datos(puntos azules)
### El Objetivo es estimar un modelo que prediha Y con el error mas
### mas pequeño posible

# linear model
model1 <- lm(y ~ X)


# Polynomial model (there is an easier way!)
model2 <- lm(y ~ X + I(X^2) + I(X^3) + I(X^4) + 
               I(X^5) + I(X^6) + I(X^7) + I(X^8) +
               I(X^9) + I(X^10) + I(X^11) + I(X^12) +
               I(X^13) + I(X^14) + I(X^15) +
               I(X^16) + I(X^17) + I(X^18),
             data=data)

#Nonparametric Model
model3 <- smooth.spline(X, y, df=200)
#df es la flexibilidad del modelo (grados de libertad del spline)

### Plot modelo lineal
plot(X, y, col='deepskyblue4', xlab='X', main='Linear')
abline(lm(y ~ X), col = "blue", lwd = 4)

### Plot polinomio
plot(X, y, col='blue', xlab='X',
     main='Polynomial')
lines(X, fitted(model2), col='red', lwd=4)

### Plot Spline
plot(X, y, col='deepskyblue4', xlab='X',
     main='Spline')
lines(smooth.spline(X, y, df=200), 
      col='green', lwd=4)

#####
rmse = function(actual, predicted) {
  sqrt(mean((actual - predicted) ^ 2))
}
predicted1<- fitted(model1)
predicted2<- fitted(model2)
predicted3<- predict(model3)


rmse(y,predicted1)
rmse(y,predicted2)
rmse(y,predicted3)


#RMSE    values
#1     Linear   119.46405
#2   Polynomial  88.87396
#3     Spline  67.72450

### Ahora con data que no ha sido vista 

set.seed(2)
y2 = dgm + rnorm(length(X), mean = 10,
                 sd = 100) 

plot(X, y2, col='deepskyblue4', xlab='X', main='The Unseen 2nd Sample')

##             Linear Polynomial   Spline
## Seen-data   119.4640   88.87396  67.7245
## Unseen-data 123.4378  109.99681 122.3018

## Machine learning se enfoca en la predicción mas que justificar un
## modelo Teorico.
## La regla es simple, minimizar RMSE
## El spline predice muy bien cuando usa la data conocida (training)
## pero no es tan bueno para predecir la data nueva, esto se llama
## overfitting
## cuando lo relevante es la predicción, RMSE debe ser evaluado
## con data fuera de la muestra, lo que hemos llamado "test set"
