### R Script para Realizar Regresiones  Ridge y Lasso
## Limpiando la Memoria
rm(list=ls()) 
## LLamando a la Libreria (Recuerde que primero debe instalar esta libreria)
library(ISLR)  
# como el broase de STATA
fix(Hitters)
## Muestra las variables incluidas en la base 
names(Hitters) 
## muestra las dimensiones de la base
dim(Hitters)
## muestra el numero de observaciones con valores missing
sum(is.na(Hitters$Salary)) 
## elimina las observaciones missing
Hitters=na.omit(Hitters)
dim(Hitters)
sum(is.na(Hitters))

### Transforma las variables a un formato de solo números x e y
x=model.matrix(Salary~.,Hitters)[,-1]
y=Hitters$Salary
library(glmnet)
### define el conjunto de valores de lamba 
grid=10^seq(10,-2,length=100)
## realiza la regresion ridge (opcion alpha=0)
ridge.mod=glmnet(x,y,alpha=0,lambda=grid)
dim(coef(ridge.mod))
ridge.mod$lambda[50]
coef(ridge.mod)[,50]
sqrt(sum(coef(ridge.mod)[-1,50]^2))
ridge.mod$lambda[60]
coef(ridge.mod)[,60]
sqrt(sum(coef(ridge.mod)[-1,60]^2))
### prediciendo el valor de y para lambda=50
predict(ridge.mod,s=50,type="coefficients")[1:20,]

### Ahora dividimos la muestra en dos grupos
### Training and Test Set (or validation)
set.seed(1)
train=sample(1:nrow(x), nrow(x)/2)
test=(-train)
y.test=y[test]
### Implementamos la regression ridge sobre todos los posibles valores de lambda
ridge.mod=glmnet(x[train,],y[train],alpha=0,lambda=grid, thresh=1e-12)
## Prediciendo con el modelo entrenado en el conjunto de test para lambda=4
## y calculando el  test MSE
ridge.pred=predict(ridge.mod,s=4,newx=x[test,])
mean((ridge.pred-y.test)^2)
##modelo con solo el intercepto
mean((mean(y[train])-y.test)^2)
### equivalente a un modelo con lambda muy alto
ridge.pred=predict(ridge.mod,s=1e10,newx=x[test,])
mean((ridge.pred-y.test)^2)
## modelo con lambda=0
ridge.pred=predict(ridge.mod,s=0,newx=x[test,],exact=T,x=x[train,],y=y[train])
mean((ridge.pred-y.test)^2)
## resultado similar
lm(y~x, subset=train)
predict(ridge.mod,s=0,exact=T,type="coefficients",x=x[train,],y=y[train])[1:20,]

### Cross validation


dim(x[train,])
y[train]
set.seed(1)
## Realizando la ridge regression para diferentes valores de lambda
## 
cv.out=cv.glmnet(x[train,],y[train],alpha=0)
plot(cv.out)
bestlam=cv.out$lambda.min
bestlam
ridge.pred=predict(ridge.mod,s=bestlam,newx=x[test,])
mean((ridge.pred-y.test)^2)
out=glmnet(x,y,alpha=0)
predict(out,type="coefficients",s=bestlam)[1:20,]

# The Lasso
lasso.mod=glmnet(x[train,],y[train],alpha=1,lambda=grid)
plot(lasso.mod)
set.seed(1)
cv.out=cv.glmnet(x[train,],y[train],alpha=1)
plot(cv.out)
bestlam=cv.out$lambda.min
lasso.pred=predict(lasso.mod,s=bestlam,newx=x[test,])
mean((lasso.pred-y.test)^2)
out=glmnet(x,y,alpha=1,lambda=grid)
lasso.coef=predict(out,type="coefficients",s=bestlam)[1:20,]
lasso.coef
lasso.coef[lasso.coef!=0]
