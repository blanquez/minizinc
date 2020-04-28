%   TESTE
% + FESTE
% + DEINE
% -------
%  KRAFTE

% Declaracion de variables
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

% Restricciones
constraint E+E+E=(E mod 10);
constraint T+T+N+((E+E+E) div 10)=(T mod 10);
constraint S+S+I+((T+T+N) div 10)=(F mod 10);
constraint E+E+E+((S+S+I) div 10)=(A mod 10);
constraint T+F+D+((E+E+E) div 10)=(R mod 10);
constraint ((T+F+D) div 10) = K;
%constraint K+R+A+F+T+E>15;

% Solucion
solve satisfy;
output ["   \(T)\(E)\(S)\(T)\(E)\n + \(F)\(E)\(S)\(T)\(E)\n + \(D)\(E)\(I)\(N)\(E)\n" ++
" -------\n  \(K)\(R)\(A)\(F)\(T)\(E)\n"];