#Programa en R que permite calcular
#el valor de una integral mediante 
#la regla de integración de Romberg

#===========DATOS_INICIALES===============

#Función:

f <- function(x) {
	f <- (x*x+x+1)*cos(x)
}

#Extremos de Integración:

a <- 0
b <- pi*0.5

#Precisión Deseada:

prec <- 0.0001

#==============PROGRAMA===================

#Definición del vector que almacena la serie

t <- c()

#Inicio de la Serie

serie <- (b-a)*( f(a)+f(b) ) * 0.5
registro <- serie

#Cálculo de la serie recursivamente

iter <- 1

while ( TRUE ) {
	iter <- iter + 1
	n <- 2^(iter-2)
	h <- (b-a)/(2^(iter-1))
	aux <- 0
	for ( k in c(1:n) ) {
		aux <- aux + f( a+(2*k-1)*h )
	}
	serie <- serie/2 + h*aux
	t <- c(t,serie)
	if ( abs(serie-registro)<prec ) {
		break
	}
	registro <- serie
}

#Construcción de la matriz con el vector t

m <- length(t)
matriz <- matrix( rep(0, times=(m*m)), nrow=m, ncol=m )
matriz[,1] <- t

for ( k in c(2:m) ) {
	for ( j in c(k:m) ) {
	matriz[j,k] = ( (4^(k-1))*matriz[j,k-1]-matriz[j-1,k-1] )/( (4^(k-1))-1 )
	}
}

#Mostramos el resultado por pantalla

print( paste('Valor Estimado de la Integral =',matriz[m,m]) )
