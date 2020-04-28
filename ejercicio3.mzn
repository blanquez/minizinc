% Encontrar una asignacion de profesores que satisfaga:
%  - Una unica aula entre 9:00 y 15:00
%  - Solo puede estar ocupada por un unico profesor al mismo tiempo
%  - Cada profesor debe impartir una hora de clase
%  - Profesor 1: 11:00 - 15:00
%  - Profesor 2: 11:00 - 13:00
%  - Profesor 3: 10:00 - 14:00
%  - Profesor 4: 10:00 - 13:00
%  - Profesor 5: 11:00 - 13:00
%  - Profesor 6: 09:00 - 15:00
include "globals.mzn";

% Declaracion de varibles

var 11..15: p1;
var 11..13: p2;
var 10..14: p3;
var 10..13: p4;
var 11..13: p5;
var 9..15: p6;

% Restricciones

constraint alldifferent([p1,p2,p3,p4,p5,p6]);

% Solucion
solve satisfy;
output ["Profesor 1: \(p1):00-\(p1+1):00\n" ++
"Profesor 2: \(p2):00-\(p2+1):00\n" ++
"Profesor 3: \(p3):00-\(p3+1):00\n" ++
"Profesor 4: \(p4):00-\(p4+1):00\n" ++
"Profesor 5: \(p5):00-\(p5+1):00\n" ++
"Profesor 6: \(p6):00-\(p6+1):00\n"
];