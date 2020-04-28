% Encontrar una asignacion de profesores que satisfaga:
%  - 4 aulas entre 9:00 y 13:00
%  - Solo puede estar ocupada por un unico profesor al mismo tiempo
%  - 3 asignaturas de 1h(IA, TSI, FBD)
%  - Estudiantes en 4 grupos(G1,G2,G3,G4)
%  - Cada grupo una asignaura en cada momento
%  - Cada profesor solo imparte una asignatura en cada momento
%  - Profesor 1: IA-G1 IA-G2 TSI-G1 TSI-G2, Sin horario restringido
%  - Profesor 2: FBD-G1 FBD-G2, 10:00 - 11:00
%  - Profesor 3: TSI-G3 TSI-G4 FBD-G3 FBD-G4, Sin horario restringido
%  - Profesor 4: IA-G3 IA-G4, 09:00-10:00
include "globals.mzn";

% Declaracion de varibles

set of int: N_AULAS = 1..4;
set of int: FRANJAS = 9..13;
array[N_AULAS,FRANJAS] of var 1..12: asignacion;

% Restricciones



% Solucion