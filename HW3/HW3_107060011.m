% Control System Homework 3

clc; clear; close all;

%% Part 1. (CP3.1)
% Part (a)
num = [1]; den = [1 10];
sys_tf = tf(num, den);
sys_ss = ss(sys_tf)
% Part (b)
num = [1 5 3]; den = [1 8 5];
sys_tf = tf(num, den);
sys_ss = ss(sys_tf)
% Part (c)
num = [1 1]; den = [1 3 3 1];
sys_tf = tf(num, den);
sys_ss = ss(sys_tf)

%% Part 2. (CP3.2)
% Part (a)
A = [0 1;2 8]; B = [0;1]; C = [1 0]; D = [0];
sys_ss = ss(A, B, C, D);
sys_tf = tf(sys_ss)
% Part (b)
A = [1 1 0;-2 0 4;5 4 -7]; B = [-1;0;1]; C = [0 1 0]; D = [0];
sys_ss = ss(A, B, C, D);
sys_tf = tf(sys_ss)
% Part (c)
A = [0 1;-1 -2]; B = [0;1]; C = [-2 1]; D = [0];
sys_ss = ss(A, B, C, D);
sys_tf = tf(sys_ss)

%% Part 3. (CP3.4)
% Part (a)
A = [0 1 0;0 0 1;-3 -2 -5]; B = [0;0;1]; C = [1 0 0];
sys_ss = ss(A, B, C, D);
sys_tf = tf(sys_ss) % Y(s)/U(s)
% Part (b)
x0 = [0;-1;1]; % initial conditions
t = [0:0.01:10]; u = 0*t;
[y T x] = lsim(sys_ss, u, t, x0);
subplot(1,3,1), plot(T, x(:,1));
xlabel('Time (s)'), ylabel('x_1(t)')
subplot(1,3,2), plot(T, x(:,2));
xlabel('Time (s)'), ylabel('x_2(t)')
subplot(1,3,3), plot(T, x(:,3));
xlabel('Time (s)'), ylabel('x_3(t)')
x10_sim = transpose(x(length(t),:))
% Part (c)
dt = 10;
Phi = expm(A*dt)
x10_phi = Phi*x0


%% Part 4. (CP3.7)
A = [0 1;-2 -3]; B = [0;1]; C = [1 0]; D = [0];
sys_ss = ss(A, B, C, D);

x0 = [1;0]; % initial conditions
t = [0:0.01:10]; u = 0*t;
[y T x] = lsim(sys_ss, u, t, x0);
plot(T, x(:,1), T, x(:,2),'--');
xlabel('Time (s)'), ylabel('x(t)'), grid minor
title('x_1(t):solid; x_2(t):dashed');

%% Part 5. (CP3.8)
syms K
A = [0 1 0;0 0 1;-2 -K -2]; B = [0;0;1]; C = [1 0 0]; D = [0];
EV = eig(A)
% K from 0 to 100
subplot(1,3,1);
ezplot(real(EV(1,1)), [0,100]);
hold on
ezplot(imag(EV(1,1)), [0,100]);
xlabel('K'), ylabel('Characteristic Values');
legend('Real Part', 'Imaginary Part'), grid minor
subplot(1,3,2);
ezplot(real(EV(2,1)), [0,100])
hold on
ezplot(imag(EV(2,1)), [0,100]);
xlabel('K'), ylabel('Characteristic Values');
legend('Real Part', 'Imaginary Part'), grid minor
subplot(1,3,3);
ezplot(real(EV(3,1)), [0,100])
hold on
ezplot(imag(EV(3,1)), [0,100]);
xlabel('K'), ylabel('Characteristic Values');
legend('Real Part', 'Imaginary Part'), grid minor
% K from 0 to 100 (real part only)
figure;
subplot(1,3,1);
ezplot(real(EV(1,1)), [0,100]);
xlabel('K'), ylabel('Real Part Value'), grid minor
subplot(1,3,2);
ezplot(real(EV(2,1)), [0,100]), grid minor
subplot(1,3,3);
ezplot(real(EV(3,1)), [0,100]), grid minor

% K from 0 to 1 (real part only)
figure;
subplot(1,3,1);
ezplot(real(EV(1,1)), [0,1]);
xlabel('K'), ylabel('Real Part Value'), grid minor
subplot(1,3,2);
ezplot(real(EV(2,1)), [0,1]), grid minor
subplot(1,3,3);
ezplot(real(EV(3,1)), [0,1]), grid minor
