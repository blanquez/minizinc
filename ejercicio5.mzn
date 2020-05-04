% EJERCICIO 5
include "globals.mzn";

% Profesor de cada asignatura(Condicion e)
array[1..19] of int: profes = [1,4,1,2,2,3,5,6,3,7,8,9,10,11,12,13,14,15,16];

% Horas de cada asignatura
array[1..9] of int: horas = [4,2,4,4,4,2,2,2,1];

% Bloque minimo de asignatura
array[1..19] of int: bloques = [2,1,2,2,2,1,1,2,1,1,1,1,1,1,1,1,1,1,1];

% Horario a resolver(Condicion a)
set of int: HORAS = 8..13;
set of int : DIAS = 1..5;
array[HORAS,DIAS] of var 1..19: horario;

% Restricciones
% Condicion d
constraint forall(j in DIAS)(all_different( [horario[i,j] | i in HORAS] ));

% Condicion f
constraint forall(j in DIAS)(all_different( [profes[horario[i,j]] | i in HORAS] ));

% Condicion c
constraint forall(j in DIAS)(bloques[horario[13,j]] == 1);
constraint forall(j in DIAS)(bloques[horario[10,j]] == 1);
constraint forall(i in HORAS, j in DIAS)(if bloques[horario[i,j]] == 2 /\ horario[i,j]<10 then horario[i+1,j] = horario[i,j]+10 endif);

% Condicion g
constraint forall(j in DIAS)(horario[11,j] == 10);

% Condicion b
constraint forall(k in 1..9)(count([horario[i,j] | i in HORAS, j in DIAS],k) == (horas[k] div  bloques[k]));

% Solucion
solve satisfy;

output [ if j == 1 then "\(i):00-\(i+1):00   " else " " endif ++
show(horario[i,j]) ++ 
if j == 5 then "\n" else " " endif | i in HORAS, j in DIAS
];
% Restricciones
% Solucion