% EJERCICIO 2
include "globals.mzn";

% Declaracion de variables
% Numero X
array[0..9] of var 0..9: x;

% Restricciones
% Valor en i igual a su numero de apariciones en X
constraint forall(i in 0..9)(x[i] == count(x,i));

% Solucion
solve satisfy;
output ["X = " ++ show(x)];