% EJERCICIO 6
include "globals.mzn";

% Declaracion de varibles
set of int: n = 1..5;
int: vasco = 1;
int: catalan = 2;
int: gallego = 3;
int: navarro = 4;
int: andaluz = 5;

int: roja = 1;
int: verde = 2;
int: blanca = 3;
int: amarilla = 4;
int: azul = 5;

int: perro = 1;
int: caracoles = 2;
int: zorro = 3;
int: caballo = 4;
int: cebra = 5;

int: pintor = 1;
int: escultor = 2;
int: diplomatico = 3;
int: violinista = 4;
int: medico = 5;

int: te = 1;
int: cafe = 2;
int: leche = 3;
int: zumo = 4;
int: agua = 5;

array[n] of var n:per;
array[n] of var n:cas;
array[n] of var n:ani;
array[n] of var n:tra;
array[n] of var n:beb;

% Restricciones

constraint all_different(per);
constraint all_different(cas);
constraint all_different(ani);
constraint all_different(tra);
constraint all_different(beb);

% Vasco vive en casa roja
constraint per[vasco] = cas[roja];
% Catalan tiene perro
constraint per[catalan] = ani[perro];
% Gallego es pintor
constraint per[gallego] = tra[pintor];
% Navarro bebe te
constraint per[navarro] = beb[te];
% Andaluz vive en primera cada a la izquierda
constraint per[andaluz] = 1;
% El de la casa verde bebe cafe
constraint cas[verde] = beb[cafe];
% Casa verde está a la derecha de la blanca
constraint cas[verde] = cas[blanca]+1;
% Escultor cria caracoles
constraint tra[escultor] = ani[caracoles];
% Diplomático vive en casa amarilla
constraint tra[diplomatico] = cas[amarilla];
% El de la casa central bebe leche
constraint beb[leche] = 3;
% Casa del andaluz al lado de la azul
constraint per[andaluz] = (cas[azul]+1) \/ per[andaluz] = (cas[azul]-1);
% Violinista bebe zumo
constraint tra[violinista] = beb[zumo];
% Zorro está al lado del médico
constraint ani[zorro] = tra[medico]+1 \/ ani[zorro] = tra[medico]-1;
% Caballo está al lado del médico
constraint ani[caballo] = tra[diplomatico]+1 \/ ani[caballo] = tra[diplomatico]-1;

% Solucion
solve satisfy;

output["Personas:   " ++ show(per) ++ "\n" ++ 
"Casas:      " ++ show(cas) ++ "\n" ++
"Animales:   " ++ show(ani) ++ "\n" ++ 
"Trabajos:   " ++ show(tra) ++ "\n" ++ 
"Bebidas:    " ++ show(beb) ++ "\n"
]