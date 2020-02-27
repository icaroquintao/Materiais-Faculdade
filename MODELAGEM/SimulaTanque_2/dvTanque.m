function xdot=dvTanque(x,u,t)
%
% function xd=dvTanque(x,u) 
% implementa a equacao diferencial de um tanque
% x nivel: unica variavel de estado
% u vazao de entrada (qe)
% xd derivada de x (valor do campo vetorial em x)

% RAR 26/9/18

% valores hipoteticos dos parametros
C=1; % area constante do tanque
K=0.5; % constante do registro
% Differential equations
%q=K*sqrt(x);
q(1,:)=K*sqrt(x(1,:));
q(2,:)=K*sqrt(x(2,:));
xd(1,:)=(u-q(1,:))/C;
xd(2,:)=(q(1,:)-q(2,:))/C;
%xd=(u-q)/C;

% para evitar erros num?ricos (o nivel nao pode ser negativo!)
if abs(x)<0.01
   xd=[0.01; 0.01];
end

xdot=xd';