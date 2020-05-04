% EJERCICIO 8
include "globals.mzn";

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

array[1..9] of int: duracion = [7,3,1,8,2,1,1,3,2];
array[1..9] of int: trabajadores = [2,3,2,2,1,2,1,1,2];

set of int: total = 0..sum(duracion);

array[1..9] of var total: inicio;
array[1..9] of var total: fin;

% Restricciones

% Duracion = fin - inicio
constraint forall(i in 1..9)(fin[i] - inicio[i] == duracion[i]);

% Asignacion de trabajadores a cada tarea
constraint cumulative(inicio, duracion, trabajadores, 3);

% Restringir requerimientos
constraint inicio[A] = 0;
constraint inicio[B] >= fin[A];
constraint inicio[C] >= fin[B];
constraint inicio[D] >= fin[A];
constraint inicio[E] >= fin[C];
constraint inicio[E] >= fin[D];
constraint inicio[F] >= fin[C];
constraint inicio[F] >= fin[D];
constraint inicio[G] >= fin[C];
constraint inicio[G] >= fin[D];
constraint inicio[H] >= fin[A];
constraint inicio[I] >= fin[F];
constraint inicio[I] >= fin[H];

% Solucion
solve minimize(max(fin));
output["T inicio: " ++ show(inicio) ++ "\nTiempo total: \(max(fin))"];