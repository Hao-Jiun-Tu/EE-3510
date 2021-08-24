% problem 1
clc;clear all; close all;
g=9.8;
l=0.5;
m=0.01;
M=2;

A=[0 1 0 0;0 0 -m*g/M 0;0 0 0 1;0 0 g/l 0];
B=[0; 1/M; 0; -1/(M*l)];
C=[0 0 1 0];                %change C here
D=[0];

[num,den]=ss2tf(A,B,C,D)    %transfer function
%我在simulink file中的Transfer Fcn定義使用num與den


% problem 2
%clc;clear all;close all;

ts=[0 20];                  %time interval
inicon=[0;0;0;0];           %initial condition
C=[0 1 1 1];                %change C here
%[t, y] = solver ('odeFile', [t0, t1], y0); 
[t,x]=ode45(@sys,ts,inicon);
y=C.*x;
y1=y(:,1);  %y
y2=y(:,2);  %y'
y3=y(:,3);  %angle
y4=y(:,4);  %angle'

figure;
plot(t,y1);
hold on;
plot(t,y2);
hold off;
title('position y');
xlabel('Time(s)'); ylabel('response');
legend('y(t)','y''(t)');

figure;
plot(t,y3);
hold on;
plot(t,y4);
hold off;
title('angle \theta');
xlabel('Time(s)'); ylabel('response');
legend('\theta(t)','\theta''(t)');

function dx=sys(t,x)
    g=9.8;
    l=0.5;
    m=0.01;
    M=2;
    
    pulse=rectangularPulse(0,0.1,t);
    A=[0 1 0 0;0 0 -m*g/M 0;0 0 0 1;0 0 g/l 0];
    B=[0; 1/M; 0; -1/(M*l)];    
    C_a=[0 1 1 1]*x;            %change C here
    D=[0];
    k=-100;                     %change k here
    Gc=(0-(C_a+pulse))*k;
    u=Gc*heaviside(t);
    dx=A*x+B*u;
end



