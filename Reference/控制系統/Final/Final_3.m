%% 3
clc;clear all; close all;

G=tf(3.6, [0.1 1.014 0.14]);
figure;
rlocus(G);      %check if G is ok with spec

zeta=0.6;      %change zeta to get a fine PO
PO=100*exp(  -zeta*pi/   (1-zeta^2)^0.5)

z=20;            %choose z p to get a new root locus and thus have a Ts<=4
p=50;           % z p left-hand side plane
Gc=tf([1 z],[1 p]);
L=Gc*G;

figure;
rlocus(L);
sgrid(zeta,10^4);

K=10.1;               % choose K by new root locus

T=feedback(K*L,1);

figure;
step(T)
stepinfo(T)
