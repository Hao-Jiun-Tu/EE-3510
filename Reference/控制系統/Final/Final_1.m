%% 1(a)
clc;clear all; close all;

K=5; %Kv=18
G=tf(3.6,[0.036 0.94 1 0]);
figure;
margin(K*G);

w_c=0.17;            %wc
attenuation_db=40.4;  %M

Gc = Bode_lag(K,w_c,attenuation_db);
L=G*Gc;
figure;
margin(L);


%% 1(b) Bode_lead
clc;clear all; close all;
G=tf(3.6,[0.036 0.94 1 0]);
figure;
margin(G);      %PM=26.8

K=1;           % 1st parameter used to achieve error constant  需要計算Kv去求K的關係式
w_m=1.85;      % 2nd parameter                 Bode上的
phi_m=46;      % 3rd parameter (in degrees) 需要加上去的角度
Gc1=Bode_lead(K,phi_m,w_m);
 
L=G*Gc1;
figure(2)
margin(L);

K=1;           % 1st parameter used to achieve error constant  需要計算Kv去求K的關係式
w_m=3.93;      % 2nd parameter                 Bode上的
phi_m=20;      % 3rd parameter (in degrees) 需要加上去的角度
Gc2=Bode_lead(K,phi_m,w_m);
figure(3)
margin(L);

K=5;        %需要計算Kv去求K的關係式
L=K*L;
L=L*Gc2;
