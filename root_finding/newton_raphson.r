#Programa en R para encontrar la raíz de una
#función mediante el método de Newton-Raphson.

#==============DATOS_INICIALES===============

#Función:

f <- function(x) {
	f <- x*x-3*x+exp(x)-2
	return(f)
}

#Derivada Función:

der_f <- function(x) {
	der_f <- 2*x-3+exp(x)
	return(der_f)
}

#Intervalos:

lista_izq <- c(-0.5,1.3)
lista_der <- c(-0.2,1.6)

#Precisión:

precision <- 0.0001

#==============PROGRAMA=====================

m <- length(lista_izq)

for ( i in c(1:m) ) {
	root=(lista_izq[i]+lista_der[i])/2
	while ( abs(f(root))>precision ) {
		root <- root-( f(root)/der_f(root) )
	}
	print( paste('Root Found: x=',root) )
	print( paste('f(x)=',f(root)) )
}

