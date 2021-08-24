% problem 1
clc;clear all; close all;

%parameters
g=9.81;
L=1;
m=10;
M=100;

%PID tuning
KP = -7000;
KI = -100;
KD = -100;

r = 0;
%u = (-KP*x(4)-KI*x(3)-KD*x(5))
%function         
func = @(t,x) [x(2); (-m*g*cos(x(4))*sin(x(4))+m*L*x(5)^2*sin(x(4)))/(M+m*(1-cos(x(4))^2)); x(4); x(5); ((M+m)*g*sin(x(4))/L-m*x(5)^2*cos(x(4))*sin(x(4)))/(M+m*(1-cos(x(4))^2))]+ (-KP*x(4)-KI*x(3)-KD*x(5))*[0; 1; 0; 0; -cos(x(4))/L]/(M+m*(1-cos(x(4))^2));
T=linspace(0,15,1e3);
x0=[0;0;0;1;0];         %initial condition
[t,y]=ode45(@(t,x) func(t,x), T, x0);

y1=y(:,1);  %y
y2=y(:,2);  %y'
y3=y(:,3);  %theta integral
y4=y(:,4);  %theta
y5=y(:,5);  %theta'


%theta
figure;
plot(t,y4);
title('Output response: \theta');
xlabel('Time(s)');
ylabel('Angular rotation(rad)');

%derivative of theta
figure;
plot(t,y5);
title('Output response: \theta''');
xlabel('Time(s)');
ylabel('Angular rotation(rad)');

%reference
syms x;
digits(6);
eqn = M*L*x^3-KD*x^2-((M+m)*g+KP)*x-KI == 0;
s = solve(eqn,x);         %q(s)
vpa(s)                    %roots' value


%% problem2
clc;clear all; close all;
%run simulink
% param
m=10;
M=100;
L=1;
g=9.81;

%change parameters here
KP = -7000;
KI = -100;
KD = -100;

%reference
syms x;
digits(6);
eqn = x^2-((M+m)*g)/(M*L) == 0;
s = solve(eqn,x);           %q(s)
ans1=vpa(s)                 %roots' value

syms x;
digits(6);
eqn = x^2+KP/KD*x+KI/KD == 0;
s = solve(eqn,x);           %q(s)
ans2=vpa(s)                 %roots' value

%% Characteristic equation
clc; clear all; close all;

syms s KP KI KD
m=10;
M=100;
L=1;
g=9.81;

G = (-1/(M*L))/(s^2-(M+m)*g/(M*L));
Gc = (KD*s^2+KP*s+KI)/s;
(1+G*Gc)



