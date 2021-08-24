% problem 1
clc;clear all; close all;

%parameters
g=9.81;
L=1;
m=10;
M=100;

%PID tuning
KP = -2000;
KI = -10;
KD = -10;

%ref signal
r=0;
%cos(x(4))
%u=(-KP*x(4)-KI*x(3)-KD*x(5))
%(M+m*(1+cos(x(4))^2));

%function
fun=@(t,x) [x(2); ((-KP*x(4)-KI*x(3)-KD*x(5))-(m*g*cos(x(4))*sin(x(4)))+(m*L*sin(x(4))*x(5)^2))/(M+m*(1+cos(x(4))^2)); x(4); x(5); 1/(M+m*(1-cos(x(4))^2))*(-(cos(x(4))*(-KP*x(4)-KI*x(3)-KD*x(5))/L)-(m*sin(x(4))*cos(x(4))*x(5)^2)+((M+m)*g*sin(x(4))/L))]
T=linspace(0,150,1e3);
x0=[0;0;0;1;0];         %initial condition
[t,y]=ode45(@(t,x) fun(t,x), T, x0);

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
KP = -2000;
KI = -10;
KD = -10;



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

