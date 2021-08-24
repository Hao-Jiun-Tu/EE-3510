clc
clear all
syms s KD KI KP

m=10;
M=100;
L=1;
g=9.81;

g=(-1/(M*L))/(s^2-((M+m)*g)/(M*L));
gc=(KD*s^2+KP*s+KI)/s;
q=1+gc*g
