% Numero X de 10 digitos tal que cada posicion n represente cuantas veces aparece n en x
include "globals.mzn";

% Declaracion de variables

array[0..9] of var 0..9: X;

% Restricciones

constraint forall(i in 0..9)(X[i] == count(X,i));

% Solucion
solve satisfy;
output ["X = "];
output ["\(X[i])" | i in 0..9];