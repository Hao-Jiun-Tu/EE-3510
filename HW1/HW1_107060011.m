% Control System Homework 1

clc; clear; close all;

%% Part 1. (Basic Arithmetic)
x = [2 1+2i; -0.45 5]
I = eye(2)
z1 = 1/2*log(x+sqrt(1+x^2)) + I

%% Part 2. (Matrix/Vector)
A = [12 34 -4; 34 7 87; 3 65 7]
B = [1 4 7; 2 5 8; 3 6 9]

z2 = A*B
z3 = A.*B
z4 = A^3
z5 = A.^3
z6 = [A([1,3],:); B^2]
z7 = eig(B)
z8 = det(A)

%% Part 3. (Equation Solving)
C = [1/2 1/3 1/4; 1/3 1/4 1/5; 1/4 1/5 1/6]
D = [0.95; 0.67; 0.52]
X_values = inv(C)*D  % X_values = x1, x2, x3
D(3,1) = 0.53
X_values = inv(C)*D

%% Part 4. (Loop Statement)
for i = 1:9
    for j = 1:9
        Hilbert(i,j) = 1/(i+j-1) 
    end
end

%% Part 5. (Plot Equation)
% Eq1:
subplot(1,2,1)
fplot(@(x) -sqrt(cos(x))+3, [-pi/2, pi/2])
title('-sqrt(cos(x))+3')
xlabel('x')

% Eq2:
subplot(1,2,2)
syms x y
ezplot((x^2/4)-(y^2/16), [-2, 2, -4, 4])
title('x^2/4-y^2/16')
xlabel('x')
ylabel('y')

