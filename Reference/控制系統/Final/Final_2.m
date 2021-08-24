%% 2
clc;clear all; close all;

K=18; %Kp=30
G=tf([1 5],[1 2 20 3]);
figure;
margin(K*G);

zeta=0.6;      %change zeta to get a fine PO
PO=100*exp(  -zeta*pi/   (1-zeta^2)^0.5)

w_c=4.1;            %wc
attenuation_db=10.8;  %M

Gc = Bode_lag(K,w_c,attenuation_db);
L=G*Gc;
figure;
margin(L);


T=feedback(L,1);
figure;
step(T)
S=stepinfo(T)

