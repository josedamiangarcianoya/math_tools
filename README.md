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
que la raíz está entre el extremo en el que el signo
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

1.4 Método de Newton-Raphson

Para utilizar el método de Newton-Raphson es necesario
conocer la derivada de la función f(x) de la que se
pretende obtener las raíces.

En primer lugar se obtiene una primera estimación 
burda para la posición de la raíz, por ejemplo 
el valor medio del intervalo en el que se encuentra.

A continuación se tiene en cuenta la recta tangente en
la raíz calculada:

f(x) = f(x1) + f'(x1) * (x-x1)

Si ahora se considera el punto x2 como una mejor 
aproximación a la raíz, f(x2)=0 con lo cual:

0 = f(x1) + f'(x1) * (x2-x1) ->
-> x2 = x1 - f(x1)/f'(x1)

El proceso se repite iterativamente hasta que se
obtiene una solución dentro del grado de precisión
deseado.

2. Cálculo de Derivadas

2.1 Aproximación de Taylor

Este cálculo se basa en tomar la función f(x) de
la que quiere hallarse la derivada y tomar el 
desarrollo de Taylor centrado en algunos puntos
desplazados una pequeña cantidad h del punto x0 
sobre el que queremos hallar la derivada.

A continuación se toman estos desarrollos de 
Taylor y operando sobre los mismos se pueden 
obtener expresiones para la primera y la 
segunda derivada. 

Como resulta natural la expresión resultante
dependerá del número de puntos sobre los que
se toma la aproximación de Taylor.

Tomando 4 puntos:

df(x0) = (-f(x0+2h)+8f(x0+h)-8f(x0-h)+f(x0-2h))/12h

Tomando 5 puntos:

d2f(x0) = (-f(x0+2h)+16f(x0+h)-30f(x0)+16f(x0-h)-f(x0-2h))/12h^2

2.2 Coeficientes Indeterminados

El método de los coeficientes indeterminados
es una generalización del método anterior
y sigue exactamente la misma estrategia.

La mejora con respecto al caso anterior es 
que se dispone de una expresión general para
el valor de la derivada k-ésima:

f^(k)(x0) = (a1 f(x0+b1h) + a2 f(x0+b2h) + ... + an f(x0+bnh) )/(h^k)

Los coeficientes ai son los coeficientes 
indeterminados que se deben averiguar. Para
encontrarlos se debe resolver un sistema de 
ecuaciones que puede expresarse de forma matricial.

Una vez resuelto es solo es necesario sustituir
para averiguar la solución deseada.

3. Cálculo de Integrales

3.1 Regla del Trapecio

Para calcular la estimación de la integral
la regla del trapecio utiliza un polinomio interpolador
lineal P(x) que pasa por una serie de nodos predefinidos.

Dada una función f(x) y unos extremos para la
integral a y b la estimación para la integral 
toma la forma:

integral( f(x) ) = h/2 ( f(a)+f(b) ) + h * sum(f_k)

Donde f_k = f(x_k) y x_k = a + (k-1) / h.

Lógicamente el número de nodos interpoladores que 
serán necesarios dependerán de la precisión h con
la que se quiere realizar la estimación.

3.2 Regla de Simpson 1/3

En este caso la regla de Simpson 1/3 utiliza
un polinomio interpolador de segundo orden
bajo tres nodos consecutivos.

De esta forma al igual que en la regla del
trapecio se obtiene una fórmula que permite
el cálculo numérico de la integral:

integral( f(x) ) = h/3( f(a)+f(b) )+2h/3 * sum(f_2k+1)+4h/3 * sum(f_2k)

Donde f_k = f(x_k) y x_k = a + (k-1) / h.

Nótese que esto permite separar la contribución
de los términos pares e impares.

3.3 Regla de Simpson 3/8

En este caso la regla de Simpson 3/8 utiliza
un polinomio interpolador de tercer orden
bajo cuatro nodos consecutivos.

De esta forma al igual que en la regla de 
Simpson 1/3 se obtiene una fórmula que 
permite el cálculo numérico de la integral:

integral( f(x) ) = 3h/8( f(a)+f(b) ) + 6h/8 * sum(f_3k+1) + 9h/8 * sum(f_3k-1 +f_3k)

Donde f_k = f(x_k) y x_k = a + (k-1) / h siendo
h la precisión deseada.

3.4 Regla Recursiva del Trapecio

Este método consiste en construir una serie de
manera recursiva construida de tal manera que
la misma converge al valor de la integral que 
se quiere estimar.

Como es lógico cada término de la serie puede
calcularse a partir del anterior teniendo en 
cuenta las bases de la regla del trapecio 
obteniendo así la siguiente expresión para 
cada uno de los términos:

T(j) = 0.5 * T(j-1) + h * sum(f_2k-1)

Donde f_2k-1 = f(x_2k-1) y x_2k-1 = a + (2k-1)*h
siendo h = (b-a)/2^(j-1).

Nótese que dada una precisión el valor estimado
de la integral será simplemente el término de 
la serie tal que se diferencie del anterior una
cantidad menor que dicha precisión.

3.5 Regla Recursiva de Simpson 1/3

Este método es de alguna forma una extensión de
la regla recursiva del trapecio ya que hace uso
de los términos de su serie para el cálculo de
una nueva serie S(j). Cada uno de los términos
toma el valor:

S(j) = ( 4*T(j)-T(j-1) ) / 3

Al igual que en el caso anterior la solución de
la integral será el último término de la serie
y dado que esta converge se puede establecer
una precisión deseada y tomar como resultado
aquel valor de la serie tal que la diferencia 
con su valor anterior sea menor que dicha 
precisión.

3.6 Regla de Integración de Romberg

Al igual que la regla recursiva de Simpson 1/3
la regla de integración de Romberg se basa en 
la regla recursiva del trapecio.

En particular la regla de Romberg propone 
construir una matriz cuya primera columna
es igual a la serie de la regla recursiva
del trapecio. El resto de columnas se 
calculan de manera iterativa por medio de 
la expresión:

R[j,k] = ( (4^(k-1)) * R[j,k-1] - R[j-1,k-1] ) / ( (4^(k-1)) - 1 )

El resultado estimado para el valor de la 
integral es entonces el elemento R[m,m] de 
la matriz, donde m es la dimensión de dicha
matriz.

Nótese que con la fórmula de arriba algunos 
elementos de la matriz quedan vacíos.
