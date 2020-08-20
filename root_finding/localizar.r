#Función en R para localizar el intervalo en el 
#que se encuentra la raíz de una función f(x)

#==============DATOS_INICIALES=================
f <- function(x) {
	f=x*x-3*x+exp(x)-2
	return(f)
}

#Intervalo de interés [-2,4]
min <- -2
max <- 4 

#===================PROGRAMA====================

n <- 21 #Número de divisiones

#Creación de vector entre min y max con 20 elementos

a <- seq(min, max, length=n)

lista_izq <- c()
lista_der <- c()

for (i in c( 1:(n-1) )) {
	izq <- a[i]
	der <- a[i+1]
	if ( f(izq)*f(der)<0 ) {
		lista_izq <- c(lista_izq,izq)
		lista_der <- c(lista_der,der)
	} 
}

print('Minimums Found in Intervals:')
m=length(lista_izq)

for (i in c(1:m) ) {
	print( paste('(',lista_izq[i],',',lista_der[i],')') )
}	 
