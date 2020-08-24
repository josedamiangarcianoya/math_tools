#Programa en R para el cálculo de numeŕico
#de una integral por medio de la regla de
#Simpson 1/3

#==============DATOS_INICIALES===============

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

#===============PROGRAMA====================

#Cálculo de los Puntos Necesarios

n <- (b-a)/(2*h)

#Cálculo de los Parámetros

aux_par <- 0
aux_impar <- 0

for ( k in c(2:(2*n)) ) {
	if ( k %% 2 == 0 ) {
		value <- a+(k-1)*h
		aux_par <- aux_par + f(value)
	} else {
		value <- a+(k-1)*h
		aux_impar <- aux_impar + f(value)
	}
}

aux_par <- h * aux_par * 4/3
aux_impar <- h * aux_impar * 2/3

#Cálculo del Valor de la Integral

integral <- h/3 * ( f(a)+f(b) ) + aux_par + aux_impar

#Output del Resultado Deseado

print( paste('Valor Estimado de la Integral =',integral) )
