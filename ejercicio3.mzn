% EJERCICIO 3
include "globals.mzn";

% Declaracion de varibles
% Profesores(restricciones a,c y d implicitas)
var 11..14: p1;
var 11..12: p2;
var 10..13: p3;
var 10..11: p4;
var 11..12: p5;
var 9..14: p6;

% Restricciones
% Condicion b
constraint all_different([p1,p2,p3,p4,p5,p6]);

% Solucion
solve satisfy;
output ["Profesor 1: \(p1):00-\(p1+1):00\n" ++
"Profesor 2: \(p2):00-\(p2+1):00\n" ++
"Profesor 3: \(p3):00-\(p3+1):00\n" ++
"Profesor 4: \(p4):00-\(p4+1):00\n" ++
"Profesor 5: \(p5):00-\(p5+1):00\n" ++
"Profesor 6: \(p6):00-\(p6+1):00\n"
];