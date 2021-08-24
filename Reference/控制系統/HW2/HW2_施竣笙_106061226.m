%% 1
clc;clear;close all;

y0 = 0.15;
wn = sqrt(2);               %natural freq
%zeta = 1/(2*sqrt(2));      %damp ratio  note:1/(2*sqrt(2)) ~= 0.35355
zeta = 0.3;                 %change damp ratio here: zeta=0.3¡B0.6¡B1(0.999)
t = [1:0.1:10];

c = y0/sqrt(1-zeta^2);
y = c*exp(-zeta*wn*t) .* sin(wn*sqrt(1-zeta^2)*t + acos(zeta));

bu=c*exp(-zeta*wn*t);
bl=-bu;
plot(t,y,t,bu,'--',t,bl,'--'), grid 
xlabel('Time (s)');
ylabel('y(t) (m)');
legend(['\omega_n=',num2str(wn),'     \zeta=',num2str(zeta)])

clear all;
%% 2
clc;clear all;close all;

num1 = [1]; den1 = [1 10]; g1 = tf(num1,den1);
num2 = [1]; den2 = [1 1]; g2 = tf(num2,den2);
num3 = [1 0 1]; den3 = [1 4 4]; g3 = tf(num3,den3);
num4 = [1 1]; den4 = [1 6]; g4 = tf(num4,den4);
num_h1 = [1 1]; den_h1 = [1 2]; h1 = tf(num_h1, den_h1);
num_h2 = [2 12]; den_h2 = [1 1]; h2 = tf(num_h2, den_h2);
h3=1;

sys5 = series(g3, g4);
sys6 = feedback(sys5, h1,+1);
sys7 = series(g2, sys6);
sys8 = feedback(sys7, h2);
sys9 = series(g1, sys8);
sys_final = feedback(sys9, h3)

%% 3
clc;clear all;close all;
num1 = [10]; den1 = [1 1]; g1 = tf(num1,den1);
num2 = [1]; den2 = [2 0.5]; g2 = tf(num2,den2);
num3 = [540]; den3 = [1]; g3 = tf(num3,den3);
num4 = [0.1]; den4 = [1]; g4 = tf(num4,den4);

sys1 = series(g1, g2);
sys2 = feedback(sys1, g4);
sys3 = series(g3, sys2);
sys_final = feedback(sys3, 1)