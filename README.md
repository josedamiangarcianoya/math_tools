Math Tools (Herramientas Matemáticas)

Este pequeño proyecto pretende construir una serie de 
herramientas matemáticas simples por medio del lenguaje
R.

1. Raíces de Ecuaciones

1.1 Localización de Raíces

La mayoría de los métodos que se utilizan para calcular 
las raíces de una ecuación dependen de la previa 
localización de la misma en un intervalo (a,b).

Para ello se puede utilizar un criterio matemático
bastante simple, si el signo de la función en los
extremos del intervalo es distinto entonces está 
garantizado que la función pasa por f(x)=0.

1.2 Método de la Bisección

El método de la bisección consiste en tomar el valor
medio del intervalo en el que se supone que se tiene
la raíz. 

A continuación se comprueba si el signo de la función
aplicada al valor medio coincide con el extremo de 
la izquierda o con el de la derecha. Sabemos entonces 
que el mínimo está entre el extremo en el que el signo
no coincide y el valor medio.

El proceso se repite iterativamente hasta alcanzar 
una precisión deseada que se establece al principio.

1.3 Método de la Régula Falsi

El método de la régula falsi es muy similar al método
de la bisección. La diferencia está en que en lugar de 
utilizar el valor medio del intervalo se hace una 
estimación basada en la aproximación de que la función
entre los extremos del intervalo considerado (a,b) es 
muy similar a una recta. 

En ese caso la estimación de la función es simplemente:

f(x) = f(a) + ( f(b) - f(a) ) / (b-a) * (x-a)

Como se busca el punto x=c tal que f(c)=0, la estimación
permite despejar c que adopta la expresión:

c = a - f(a) * (b-a) / ( f(b) - f(a) )

El resto del procedimiento es igual que para el 
método de la bisección. Se comprueba el signo de
f(c) y se repite el proceso iterativamente 
haciendo el intervalo cada vez más estrecho.
