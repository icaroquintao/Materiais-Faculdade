clear all
close all
clc
k=-0.4;
zeta=1.7;
wn=1;
%tal=2.5;
t=0:0.1:15;
num=[k*wn^2];
den=[1 2*zeta*wn wn^2];
u=-0.4*ones(1,length(t));
u=0.4*[zeros(1,10) ones(1,length(t)-10)];
G=tf(num,den);
figure()
y=lsim(G,u,t);
yn=0.25+y+0.01*randn(length(t),1);
plot(t,yn)
hold on
plot(t,u)
grid on
  tal1=4;
  k1=-0.42;
 num1=[k1/tal1];
 den1=[1 1/tal1];
 G1=tf(num1,den1);
 yest=lsim(G1,u,t);
 plot(t,0.25+yest,'r')