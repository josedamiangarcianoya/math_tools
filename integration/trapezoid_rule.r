#Programa en R para calcular la estimación
#de una integral por medio de la regla del
#trapecio

#============DATOS_INICIALES================

#Función:

f <- function(x) {
	f <- x*x*x-3*x*x-x+3
	return(f)
}

#Extremos de la Intregral:

a <- 0
b <- 1.35

#Precisión:

h <- 0.0001

#===============PROGRAMA===================

#Cálculo de los puntos necesarios

# b-a=x_(n+1)-a=a+n*h-a=n*h -> n=(b-a)/h

n <- (b-a)/h

#Creamos un vector auxiliar

vector <- rep(1, times=n-1)

for ( k in c(2:n) ) {
	vector[k-1] <- a+(k-1)*h
	vector[k-1] <- f(vector[k-1])
}

#Cálculo del Valor Estimado de la Integral

integral <- h/2*( f(a)+f(b) )+h*( sum(vector) )

#Presentación del Resultado

print( paste('Valor de la Integral =',integral) )