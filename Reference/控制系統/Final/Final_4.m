%% 4 (a)
clc;clear all; close all;

G=tf(1, [1 -5 6]);
figure;
rlocus(G);      %check if G is ok with spec

%Gc
z=50;            %choose z p to get a new root locus and thus have a Ts<=4
p=100;           % z p left-hand side plane
Gc=tf([1 z],[1 p]);

zeta=0.7;      %change zeta to get a fine PO
PO=100*exp(  -zeta*pi/   (1-zeta^2)^0.5)

L=Gc*G;
figure;
rlocus(L);
sgrid(zeta,10^4);
K=5*1000;               % choose K by new root locus
T=feedback(K*L,1);

figure;
step(T)
stepinfo(T)

%b
zeta=0.7;      %change zeta to get a fine PO
PO=100*exp(  -zeta*pi/   (1-zeta^2)^0.5)
w_n=4/zeta;

C=12000;
Gp=C*tf([1],[1 250]);
T=T*Gp;
S=stepinfo(T)


