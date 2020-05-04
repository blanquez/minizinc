% EJERCICIO 1
include "globals.mzn";

% Declaracion de variables
% Letras
var 0..9: E;
var 0..9: T;
var 0..9: N;
var 0..9: S;
var 0..9: I;
var 0..9: F;
var 0..9: A;
var 0..9: D;
var 0..9: R;
var 0..9: K;

% Todos los digitos diferentes

constraint all_different([E,T,N,S,I,F,A,D,R,K]);

% Restricciones (SUMA + EXCEDENTE DE LA ANTERIOR)
constraint (E+10*T+100*S+1000*E+10000*T)+(E+10*T+100*S+1000*E+10000*F)+(E+10*N+100*I+1000*E+10000*D)=E+T*10+F*100+A*1000+R*10000+K*100000;

% Solucion
solve satisfy;
output ["E=\(E)\nT=\(T)\nN=\(N)\nS=\(S)\nI=\(I)\nF=\(F)\nA=\(A)\nD=\(D)\nR=\(R)\nK=\(K)\n"];