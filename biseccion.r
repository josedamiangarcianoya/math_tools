#Función en R para localizar una raíz aproximada
#luego de haber estimado el intervalo en el que se
#encuentra dicha raíz.

#=================DATOS_INICIALES================

#Función:

f <- function(x) {
	f=x*x-3*x+exp(x)-2
	return(f)
}

#Lista con los extremos de los intervalos en los 
#cuales se ha estimado que existe una raíz:

lista_izq <- c(-0.5,1.3)
lista_der <- c(-0.2,1.6)

#Precisión con la que se quiere estimar la raíz:

precision <- 0.0001

#====================PROGRAMA===================

m <- length(lista_izq)

for ( root in c(1:m) ) {
	med <- (lista_izq[root]+lista_der[root])/2
	while ( abs( f(med) )>precision ) {
		if ( f(med)*f(lista_izq[root])>0 ) {
			lista_izq[root] <- med
			med <- (lista_izq[root]+lista_der[root])/2
		} else {
			lista_der[root] <- med
			med <- (lista_der[root]+lista_izq[root])/2
		}
	}
	print( paste('Root Found:',med) )
	print( paste('f(x) = ',f(med)) )
}
