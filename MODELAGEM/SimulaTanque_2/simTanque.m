% Simula o modelo de dois tanques. Equacao em dvTanque.m
% A derivacao tanto do modelo nao linear quanto da funcao de transferencia
clear all 
close all
clc

% tempo inicial e final
t0=0;
tf=120;

% intervalo de integracao
h=0.2;
t=t0:h:tf; % vetor de tempo para a simulacao

% parametros usados no modelo
C=1; % area constante do tanque
K=0.5; % constante do registro



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% simulacao da equacao diferencial

% condicao inicial (nivel no inicio da simulacao)
x0=[10 0]';
x=[x0 zeros(length(x0),length(t)-1)];
% a entrada eh dividida em 3 periodos. No primeiro ela eh nula (o tanque
% esvazia). No segundo a vazao de entrada passa a ser 1. No terceiro
% periodo passa a ser 1,05.
qe0=ones(1,100);
qe1=ones(1,300);
qe1p1=1.05*ones(1,201);
% juntam-se os 3 periodos em um unico vetor de entrada.
qe=[qe0 qe1 qe1p1];

for k=2:length(t)
    % chama a rotina de integracao numerica para a resolucao (numerica) da
    % equacao diferencial (balanco de massa)
    x(:,k)=rkTanque(x(:,k-1),qe(k),h,t(k));
end
figure()
plot(x(1,:),x(2,:))
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% simulacao da funcao de transferencia
% 
% ponto de operacao aos 79,8 s
h0=x(:,400);
q0(1,:)=K*sqrt(h0(1,1));
q0(2,:)=K*sqrt(h0(2,1));
R1=2*sqrt(h0(1,1))/K;
R2=2*sqrt(h0(2,1))/K;
den1=[R1*C 1];
den2=[R2*C 1];
 % A funcao de transferencia nao pode ser usada para determinar a resposta a
 % condicoes iniciais.
pause
% % O trecho 80<t<120 corresponde a um degrau de amplitude 0.05 (variacao em
% % torno do ponto de operacao)
 t2=0:h:40;
 y1=lsim(R1,den1,qe1p1(1,:)'-1,t2);
 y2=lsim(R2/R2,den2,y1',t2);
 hold on
 plot(h0(2,1)+y1,h0(1,1)+y2,'r')
 %
 pause
figure
plot(t2,h0(2,1)+y1,t2,h0(1,1)+y2)
