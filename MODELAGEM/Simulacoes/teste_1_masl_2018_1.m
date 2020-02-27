clear all
close all
clc
k=0.8;
tal=2;
t=0:0.1:15;
num=[k/tal];
den=[1 1/tal];
u=ones(1,length(t));
G=tf(num,den);
figure()
y=lsim(G,u,t);
yn=y+0.01*randn(length(t),1);
plot(t,yn)
hold on
plot(t,u)
hold on
tal1=2;
k1=0.8;
num1=[k1/tal1];
den1=[1 1/tal1];
G1=tf(num1,den1);
yest=lsim(G1,u,t);
plot(t,yest)