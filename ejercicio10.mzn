% EJERCICIO 10
include "globals.mzn";

% Declaracion de varibles
set of int: OBJETOS = 1..12;
int: peso_max = 275;
array[OBJETOS] of int: peso = [9,13,153,50,15,68,27,39,23,52,11,32];
array[OBJETOS] of int: pref = [150,35,200,160,60,45,60,40,30,10,70,30];

array[OBJETOS] of var 0..1: x;

% Restricciones
constraint sum(i in OBJETOS)(peso[i] * x[i]) <= peso_max;

% Solucion
solve maximize sum(i in OBJETOS)(pref[i] * x[i]);
output["x = " ++ show(x) ++
"\npeso = " ++ show(sum(i in OBJETOS)(peso[i] * x[i])) ++
"\npreferencia = " ++ show(sum(i in OBJETOS)(pref[i] * x[i]))
];