#Programa en R que permite calcular la 
#integral de una función utilizando la
#regla de Simpson 3/8

#============DATOS_INICIALES==============

#Función:

f <- function(x) {
	f <- x*x*x-3*x*x-x+3
	return(f)
}

#Extremos de Integración:

a <- 0
b <- 1.35

#Precisión:

h <- 0.0001

#==============PROGRAMA===================

#Cálculo del número de intervalos/3

n <- (b-a)/(3*h)

#Cálculo de las magnitudes auxiliares

aux_1 <- 0
aux_2 <- 0

for ( k in c( 1:(n-1) ) ) {
	aux_1 <- aux_1 + f( a+3*k*h )
	aux_2 <- aux_2 + f( a+(3*k-2)*h ) + f( a+(3*k-1)*h )
}

aux_2 <- aux_2 + f( a+(3*n-2)*h ) + f( a+(3*n-1)*h )

#Cálculo del valor de la integral

integral <- 3*h/8 * ( f(a)+f(b) ) + 6*h/8 * aux_1 + 9*h/8 * aux_2

#Mostramos el resultado por pantalla

print( paste('Valor estimado de la Integral =',integral) )
