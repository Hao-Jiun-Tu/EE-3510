%% 5a
clc;clear all; close all;

G=tf(1,[1 4.1 0.4]);
figure;
rlocus(G);
zeta=0.7;
sgrid(zeta,10^4)

zeta=0.7;      %change zeta to get a fine PO
PO=100*exp(  -zeta*pi/   (1-zeta^2)^0.5)

z=0.5;         %自己取
Kp=2;           %自己取
Ki=z*Kp;

p=0;            %pole=0固定
Gc=Kp*tf([1 z],[1 p]);
L=Gc*G;
figure;
rlocus(L);
zeta=0.7;
sgrid(zeta,10^4);

K=2.6;
T=feedback(K*L,1);

figure;
step(T)
S=stepinfo(T)
ess=evalfr(T-1,0)

%b
C=1/2;
Gp=C*tf([1],[1 0.5]);
T=T*Gp;
S=stepinfo(T)
ess=evalfr(T-1,0)

