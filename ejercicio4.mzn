% EJERCICIO 4
include "globals.mzn";

% Declaracion de varibles
% Asignaturas-grupo
int: IAg1 = 1;
int: TSIg1 = 2;
int: FBDg1 = 3;
int: IAg2 = 4;
int: TSIg2 = 5;
int: FBDg2 = 6;
int: IAg3 = 7;
int: TSIg3 = 8;
int: FBDg3 = 9;
int: IAg4 = 10;
int: TSIg4 = 11;
int: FBDg4 = 12;

% Horas libres/sobrantes
int: libre1 = 13;
int: libre2 = 14;
int: libre3 = 15;
int: libre4 = 16;

% Profesor de cada asignatura(Condicion f)
array[1..16] of int: profes = [1,1,2,1,1,2,4,3,3,4,3,3,5,6,7,8];

% Grupo de cada asignatura(Condicion d)
array[1..16] of int: grupos = [1,1,1,2,2,2,3,3,3,4,4,4,5,6,7,8];

% Horario a resolver(Condiciones a y b implicitas)
set of int: HORAS = 9..12;
set of int : AULAS = 1..4;
array[HORAS,AULAS] of var 1..16: horario;

% Restricciones
% Condicion c
constraint all_different( [horario[i,j] | i in HORAS, j in AULAS] );

% Condicion g
constraint forall(i in HORAS)(all_different( [profes[horario[i,j]] | j in AULAS] ));

% Condicion e
constraint forall(i in HORAS)(all_different( [grupos[horario[i,j]] | j in AULAS] ));

% Condicion h
constraint forall(j in AULAS)(profes[horario[10,j]] != 2);
constraint forall(j in AULAS)(profes[horario[9,j]] != 4);

% Solucion
solve satisfy;

output [ if j == 1 then "\(i):00-\(i+1):00   " else " " endif ++
show(horario[i,j]) ++ 
if j == 4 then "\n" else " " endif | i in HORAS, j in AULAS
];
