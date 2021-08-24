clc;clear;close all;


G=tf(40,[1 2 0]);
damp=0.4;



% % % compensation
z=9;
p=30;
Gc=tf([1 z],[1 p]);
L=Gc*G;
rlocus(L)
sgrid(damp,10^4)
my_ratio=z/p;
% Kc=22.5;
% 
% T=feedback(Kc*L,1);
% S=stepinfo(T)