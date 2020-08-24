#Programa en R que permite calcular
#el valor de una integral mediante 
#la regla recursiva de Simpson 1/3

#===========DATOS_INICIALES===============

#Función:

f <- function(x) {
	f <- (x*x+x+1)*cos(x)
}

#Extremos de Integración:

a <- 0
b <- pi*0.5

#Precisión Deseada:

prec <- 0.00000001

#==============PROGRAMA===================

#Inicio de la Serie

t <- (b-a)*( f(a)+f(b) ) * 0.5
registro_t <- t
registro_s <- 0 #No es exactamente correcto

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
	t <- t/2 + h*aux
	s <- (4*t-registro_t)/3
	if ( abs(s-registro_s)<prec ) {
		break
	}
	registro_s <- s
	registro_t <- t
}

#Mostramos el resultado por pantalla

print( paste('Valor Estimado de la Integral =',s) )
