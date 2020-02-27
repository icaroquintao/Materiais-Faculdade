function x=rkTanque(x0,u,h,t)
% function x=rk(x0,u,h,t)
% 
% implementa o algoritmo de integracao numerica Runge Kuta de 4a ordem
% x0 vetor de estado (antes de chamar a funcao... eh a condicao inicial)
% u se houver, eh o valor de entrada, considerado constante ao longo do
% intervalo de integracao, h
% h eh o intervalo de integracao
% t eh o instante de tempo logo antes de chamar a funcao de integracao
% O campo vetorial deve ser escrito no corpo da funcao dvNOME

% LAA 17/3/17
% modificado RAR 28/09/18
% Algoritmo
%A=f(x_{k-1},t_{k-1})
%B=f(x_{k-1}+h/2A,t_{k-1}+h/2)
%C=f(x_{k-1}+h/2B,t_{k-1}+h/2)
%D=f(x_{k-1}+hC,t_{k-1}+h)
% x_{k}=x_{k-1}+h/6(A+2B+2C+D)
% 1a chamada
xd=dvTanque(x0,u,t);%A
savex0=x0';
phi=xd; % A
x0=savex0+0.5*h.*xd; % condicao inicial para o proximo instante

% 2a chamada
xd=dvTanque(x0',u,t+0.5*h);%B
phi=phi+2*xd; %A+2B
x0=savex0+0.5*h.*xd; % condicao inicial para o proximo instante

% 3a chamada
xd=dvTanque(x0',u,t+0.5*h);%C
phi=phi+2*xd;%A+2B+2C
x0=savex0+h*xd; % condicao inicial para o proximo instante

% 4a chamada
xd=dvTanque(x0',u,t+h);%D
x=savex0+(phi+xd).*h./6; % Valor de x no instante atual
%phi+xd=A+2B+2C+D
