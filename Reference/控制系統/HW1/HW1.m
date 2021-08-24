%% 1
clc;clear;close all;

x = [2 1+2i;-0.45 5];
I = [1 0; 0 1]
z1 = 0.5* log(x + sqrt(1+x^2)) + I;
   
%clear all;
%% 2

A = [12 34 -4;34 7 87; 3 65 7];
B = [1 4 7; 2 5 8; 3 6 9];

%a
z2 = A * B;     %矩陣計算
%b
z3 = A .* B;    %對應element乘法
%c
z4 = A ^ 3;
%d
z5 = A .^ 3;
%e
z6 = [A([1,3],:);B^2];
%f
z7 = eig(B);
%g
z8 = det(A);

clear all;
%% 3
y1 = [1/2 1/3 1/4;1/3 1/4 1/5; 1/4 1/5 1/6];
y2 = [0.95; 0.67; 0.52];
y3 = [0.95; 0.67; 0.53];

x_val_1 = y1\y2;  
x_val_2 = y1\y3;

clear all;
%% 4
for i = 1:9
   for j = 1:9
      H(i,j) = 1/(i+j-1);
   end
end

clear all;
%% 5

%y1 = -sqrt(cos(x)) + 3;
%fxy = (x^2/4) - (y^2/16);
figure;
subplot(1,2,1);
fplot(@(x) -sqrt(cos(x)) + 3, [-pi/2, pi/2]);
title('y1');
xlabel('x');
ylabel('y');

subplot(1,2,2);
syms x y;
ezplot((x^2/4) - (y^2/16), [-2, 2, -4, 4]);
title('f(x,y)');
xlabel('x');
ylabel('y');

% 3D plot
figure;
x =[-2:2]  % value x range
y =[-4:4]  % value y range
[xm ym] = meshgrid(x,y)  % meshgrid: 2-D and 3-D grids
fxy =  (xm.^2)/4 - ((ym.^2)/16) % Your Function  fxy =f(x,y) 
surf(fxy)   % surf : Surface plot

%clear all;