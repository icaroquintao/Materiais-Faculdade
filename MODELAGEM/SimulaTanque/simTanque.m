% Simula o modelo de um tanque. Equacao em dvTanque.m
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
x0=2;
x=[x0 zeros(length(x0),length(t)-1)];

% a entrada eh dividida em 3 periodos. No primeiro ela eh nula (o tanque
% esvazia). No segundo a vazao de entrada passa a ser 1. No terceiro
% periodo passa a ser 1,05.
qe0=zeros(1,100);
qe1=ones(1,300);
qe1p1=1.1*ones(1,201);

% juntam-se os 3 periodos em um unico vetor de entrada.
qe=[qe0 qe1 qe1p1];

for k=2:length(t)
    % chama a rotina de integracao numerica para a resolucao (numerica) da
    % equacao diferencial (balanco de massa)
    x(:,k)=rkTanque(x(:,k-1),qe(k),h,t(k));
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% simulacao da funcao de transferencia

% ponto de operacao aos 79,8 s
h0=x(400);
q0=K*sqrt(h0);
R=2*sqrt(h0)/K;
den=[R*C 1];

% A funcao de transferencia nao pode ser usada para determinar a resposta a
% condicoes iniciais. 


% O trecho 20<t<80 corresponde a um degrau unitario
t1=0:h:60-h;
y1=lsim(R,den,qe1',t1);


% O trecho 80<t<120 corresponde a um degrau de amplitude 0.05 (variacao em
% torno do ponto de operacao)
t2=0:h:40;
y2=lsim(R,den,(qe1p1-1)',t2);


% faz o grafico
figure(1)
set(gca,'FontSize',18);
plot(t,x,'r');
hold on
%pause
plot(20+t1,y1,'b')
pause
plot(80+t2,h0+y2,'k--')
axis([0 120 -0.1 8.5])
xlabel('tempo')
ylabel('n?vel')
