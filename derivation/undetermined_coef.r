#Programa en R para el cálculo de la 
#derivada de una función usando el 
#método de los coeficientes indeterminados

#==============DATOS_INICIALES==============

#Función:

f <- function(x) {
	f <- x*x*x-3*x*x-x+3
	return(f)
}

#Derivada Primera

df <- function(x) {
	df <- 3*x*x-6*x-1
	return(df)
}

#Punto:

x <- 1.2

#Vector de Coeficientes:

b <- c(-2:2)

#Orden de la Derivada:

k <- 1

#Incremento Deseado:

h <- 0.0001

#=============PROGRAMA======================

#Construir la matriz del sistema

n <- length(b)
a <- matrix( 1:(n*n), nrow=n, ncol=n)

a[1,] <- rep(1, times=n)

for ( i in c(2:n) ) {
	a[i,] <- a[i-1,]*b
}


#Constuir el vector independiente

c <- matrix( rep(0, times=n), nrow=n, ncol=1 )

#Primera derivada

c[1+k,1] <- 1

#Resolvemos el sistema de ecuaciones

coef <- solve(a,c)

deriv <- 0

for ( i in c(1:n) ) {
	deriv <- deriv + coef[i,1]*f(x+b[i]*h)
}

deriv <- deriv / (h^k)

#Mostramos el resultado

print( paste('Derivada de Orden',k) )
print( paste('Valor Estimado =',deriv) )
print( paste('Valor Real =',df(x)) )