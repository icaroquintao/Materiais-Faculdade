function xdot=dvTanque(x,u,t)
%
% function xd=dvTanque(x,u) 
% implementa a equacao diferencial de um tanque
% x nivel: unica variavel de estado
% u vazao de entrada (qe)
% xd derivada de x (valor do campo vetorial em x)

% LAA 17/3/17

% valores hipoteticos dos parametros
C=1; % area constante do tanque
K=0.5; % constante do registro

% Differential equations
qs=K*sqrt(x);
xd=(u-qs)/C;

% para evitar erros num?ricos (o nivel nao pode ser negativo!)
if abs(x)<0.01
   xd=0.01;
end

xdot=xd';