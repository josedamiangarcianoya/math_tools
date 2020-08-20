#Programa en R que pretende buscar las raíces
#de una función utilizando el método de la 
#régula falsi.

#==============DATOS_INICIALES================

#Función

f <- function(x) {
	f=x*x-3*x+exp(x)-2
	return(f)
}

#Intervalos

lista_izq <- c(-0.5,1.3)
lista_der <- c(-0.2,1.6)

#Precisión

precision=0.0001

#==============PROGRAMA=====================
 
m <- length(lista_izq)

for ( i in c(1:m) ) {
	a <- lista_izq[i]-f(lista_izq[i])*(lista_der[i]-lista_izq[i])/(f(lista_der[i])-f(lista_izq[i]))
	while ( abs(f(a))>precision) {
		if ( f(a)*f(lista_izq[i])>0 ) {
			lista_izq[i] <- a
			a <- lista_izq[i]-f(lista_izq[i])*(lista_der[i]-lista_izq[i])/(f(lista_der[i])-f(lista_izq[i]))
		} else {
			lista_der[i] <- a
			a <- lista_izq[i]-f(lista_izq[i])*(lista_der[i]-lista_izq[i])/(f(lista_der[i])-f(lista_izq[i]))
		}
	}
	print( paste('Root Found: x=',a) )
	print( paste('f(x)=',f(a)) )
}
