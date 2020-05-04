% EJERCICIO 9
include "globals.mzn";
% Un vector para cada trabajador ????????????? 13

% Declaracion de varibles
% Tareas
int: A = 1;
int: B = 2;
int: C = 3;
int: D = 4;
int: E = 5;
int: F = 6;
int: G = 7;
int: H = 8;
int: I = 9;

array[1..3,1..9] of int: duracion = [| 4,3,3,2,4,3,1,1,2 | 7,5,1,5,2,2,2,3,3 | 10,7,4,8,6,1,3,5,4 |];

set of int: total = 0..sum(duracion);

array[1..9] of var total: inicio;
array[1..9] of var total: fin;

array[1..9] of var 1..3: trabajadores;

% Restricciones

% Duracion = fin - inicio
constraint forall(i in A..I)(fin[i] - inicio[i] = duracion[trabajadores[i],i]);

% Restringir requerimientos

constraint inicio[A] = 0;
constraint inicio[B] >= fin[A];

constraint inicio[C] >= fin[B];
constraint forall(i in A..B)(inicio[C]>=fin[i] \/ (inicio[C]<fin[i] /\ trabajadores[C] != trabajadores[i]));

constraint inicio[D] >= fin[A];
constraint forall(i in A..C)(inicio[D]>=fin[i] \/ (inicio[D]<fin[i] /\ trabajadores[D] != trabajadores[i]));

constraint inicio[E] >= fin[C];
constraint inicio[E] >= fin[D];
constraint forall(i in A..D)(inicio[E]>=fin[i] \/ (inicio[E]<fin[i] /\ trabajadores[E] != trabajadores[i]));

constraint inicio[F] >= fin[C];
constraint inicio[F] >= fin[D];
constraint forall(i in A..E)(inicio[F]>=fin[i] \/ (inicio[F]<fin[i] /\ trabajadores[F] != trabajadores[i]));

constraint inicio[G] >= fin[C];
constraint inicio[G] >= fin[D];
constraint forall(i in A..F)(inicio[G]>=fin[i] \/ (inicio[G]<fin[i] /\ trabajadores[G] != trabajadores[i]));

constraint inicio[H] >= fin[A];
constraint forall(i in A..G)(inicio[H]>=fin[i] \/ (inicio[H]<fin[i] /\ trabajadores[H] != trabajadores[i]));

constraint inicio[I] >= fin[F];
constraint inicio[I] >= fin[H];
constraint forall(i in A..H)(inicio[I]>=fin[i] \/ (inicio[I]<fin[i] /\ trabajadores[I] != trabajadores[i]));

% Solucion
solve minimize(max(fin));
output["T inicio: " ++ show(inicio) ++ "\nFin: " ++ show(fin) ++ "\nTiempo total: \(max(fin))"];