#Programa escrito en R que permite obtener el valor 
#de las dos primeras derivadas de una función en un 
#punto determinado.

#=================DATOS_INICIALES==================

#Función:

f <- function(x) {
	f <- x*x*x-3*x*x-x+3
	return(f)
}

#1er Derivada:

df <- function(x) {
	df <- 3*x*x-6*x-1
	return(df)
}

#2da Derivada:

df2 <- function(x) {
	df2 <- 6*x-6
	return(df2)
}

#Punto Deseado:

x <- 1.2

#Incremento:

h <- 0.0001

#=================PROGRAMA=================

#Cálculo de la Primera Derivada
print('First Derivative:')

der1 <- (-f(x+2*h)+8*f(x+h)-8*f(x-h)+f(x-2*h))/(12*h)
print( paste('Estimated Derivative: df=',der1) )
print( paste('Real Derivative: df=',df(x)) )

print('...')

#Cálculo de la Segunda Derivada
print('Second Derivative:')

der2 <- (-f(x+2*h)+16*f(x+h)-30*f(x)+16*f(x-h)-f(x-2*h))/(12*h*h)
print( paste('Estimated Derivative: df2=',der2) )
print( paste('Real Derivative: df2=',df2(x)) )
