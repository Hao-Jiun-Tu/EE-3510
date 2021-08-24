%% 3.1
%a
clc;clear;close all;
num = [1]; den = [1 10];
sys_tf = tf(num,den);
sys_ss = ss(sys_tf)

%b
clc;clear;close all;
num = [1 5 3]; den = [1 8 5];
sys_tf = tf(num,den);
sys_ss = ss(sys_tf)

%c
clc;clear;close all;
num = [1 1]; den = [1 3 3 1];
sys_tf = tf(num,den);
sys_ss = ss(sys_tf)

%% 3.2
%a
clc;clear;close all;
a=[0 1;2 8];b=[0; 1]; c=[1 0];
sys = ss(a, b, c, 0);
sys_tf = tf(sys)

%b
a=[1 1 0;-2 0 4;5 4 -7];b=[-1; 0; 1]; c=[0 1 0];
sys = ss(a, b, c, 0);
sys_tf = tf(sys)

%c
a=[0 1;-1 -2];b=[0; 1]; c=[-2 1];
sys = ss(a, b, c, 0);
sys_tf = tf(sys)

%% 3.4
clc;clear;close all;
%a
a=[0 1 0;0 0 1;-3 -2 -5];b=[0; 0; 1]; c=[1 0 0];
sys = ss(a, b, c, 0);
sys_tf = tf(sys)

%b
x0 = [0 -1 1];                  % initial condition
t = [0: 0.1: 10];               % time vector
u = 0*t;                        % input = 0
[y, t, x]=lsim(sys,u,t,x0);     %lsim -> linear simulation: find time response
figure;
plot(t,x(:,1));
hold on;
plot(t,x(:,2));
hold on;
plot(t,x(:,3));
legend('x1', 'x2', 'x3');
title('System time response');
xlabel('time (second)');
ylabel('state rexponse x(t)');
hold off;
xf_sim = x(length(t),:)'    % the solution using lsim  

% c
dt=10;              % state transfer function at t = 10
phi=expm(a*dt);     % state transfer matrix -> phi
xf_phi = phi*x0'    % the solution using state transfer function

%% 3.7
clc;clear;close all;

a=[0 1 ;-2 -3];
b=[0; 1]; 
c=[1 0];
sys = ss(a, b, c, 0);

x0 = [1; 0];
t = [0: 0.1: 10];
u = 0*t;
[y, t, x]=lsim(sys,u,t,x0); 

figure;
plot(t,x(:,1));
hold on;
plot(t,x(:,2));
legend('x1', 'x2');
title('System time response');
xlabel('time (second)');
ylabel('state response x(t)');
hold off;
xf_sim = x(length(t),:)'
%% 3.8
clc;clear;close all;
syms K;
a=[0 1 0;0 0 1;-2 -K -2];
EV=eig(a)   %eigen values of A are roots of character equation

figure;
ezplot(real(EV(1,1)),[0,100]);
hold on;
ezplot(imag(EV(1,1)),[0,100]);
legend('real part', 'imaginary part');

figure;
ezplot(real(EV(2,1)),[0,100]);
hold on;
ezplot(imag(EV(2,1)),[0,100]);
legend('real part', 'imaginary part');

figure;
ezplot(real(EV(3,1)),[0,100]);
hold on;
ezplot(imag(EV(3,1)),[0,100]);
legend('real part', 'imaginary part');

