%% 10.1 RL+lead
clc;clear all; close all;
%spec Ts<=4、zeta>=0.45
%RL+phase lead

num=[10];
den=[1 0 0];
g=tf(num,den);
figure;
rlocus(g);

% compensation
% pz left
z=10;   %zero
p=50;   %pole (在Z左邊)
Gc=tf([1 z],[1 p]);
L=Gc*g;
figure;
rlocus(L);

%從RL(L)找zeta對應的gain(K)
K=129;
L=K*L;

%漸進線
zeta=0.45;
sgrid(zeta, 10^3);

%step info
h=[-1];
sys=feedback(L,-h)
%sys=feedback(L,1)
figure;
rlocus(sys);
stepinfo(sys)
%% 10.2 Bodes + phase lead
clc;clear all; close all;

% L=40/[s(s+2)]
% specs:   Ess=5% of the velocity of ramp、 P.M.= 40
%%%% Bodes + phase lead

%%% Bode 
G=tf(40,[1 2 0]);
figure(1)
margin(G);

%%%lead
 K=1;           % 1st parameter used to achieve error constant  需要計算Kv去求K的關係式
 w_m=6.17;      % 2nd parameter                 Bode上的
 phi_m=30;      % 3rd parameter (in degrees) 需要加上去的角度
 Gc=Bode_lead(K,phi_m,w_m);

 L=G*Gc;
 figure(2)
 margin(L);
 
 figure(3)
 nyquist(L)

 
%% 10.2 Bodes + phase lag
clc;clear all; close all;

%%% Bode 
G=tf(40,[1 2 0]);
figure(1)
margin(G);

%%% lag
K=1;
w_c=1.91;   %從bode phase往左找到PM=40的地方
attenuation_db=17;      %mag(db) at w_c
Gc = Bode_lag(K,w_c,attenuation_db);    %此處有乘K
L=Gc*G;

figure(2)
margin(L)

figure(3)
nyquist(L)

%% 10.2 Root Locus + phase lead
clc;clear all; close all;

G=tf(40,[1 2 0]);

figure(1)
rlocus(G)
zeta=40*0.01;       %by slides
sgrid(zeta,10^4);

z=10;               %決定 Z P
p=40;
Gc=tf([1 z],[1 p]);
L=G*Gc;
figure(2)
rlocus(L)
sgrid(zeta,10^4);

%find precise PM 
K=p/z               %計算K的關係式
[~,Pm]=margin(K*L);
Pm
%how about error???

%% 10.2 Root Locus + phase lag
clc;clear;close all;

G=tf(40,[1 2 0]);
figure(1)
rlocus(G)
zeta=40*0.01;
sgrid(zeta,10^4)

K=0.156;            %跟zeta=0.04時的 K
alpha=1/K;          %計算K的關係式
z=0.1;              %z=0.1固定
p=z/alpha;
Gc=K*tf([1 z],[1 p]);%K有乘進去L了
L=Gc*G;
figure(2)
rlocus(L)
zeta=40*0.01;
sgrid(zeta,10^4)

[~,Pm]=margin(L);
Pm
%% 10.3 RL+lead
clc;clear all; close all;
%use RL + phase lead
%%%  specs
%%% Ts<=4, P.O<=35%
%Ts<=4 for 2'nd order sys -> real part of dominant poles locate at
%left-hand plane
%zeta up, PO down; zeta down, PO up.

G=tf(1, [1 0 0]);
figure;
rlocus(G);      %check if G is ok with spec
                %z p is locate at 0 0

zeta=0.35;      %change zeta to get a fine PO
PO=100*exp(  -zeta*pi/   (1-zeta^2)^0.5)

z=2;            %choose z p to get a new root locus and thus have a Ts<=4
p=15;           % z p left-hand side plane
Gc=tf([1 z],[1 p]);
L=Gc*G;

figure(2)
rlocus(L);
sgrid(zeta,10^4);

K=86;               % choose K by new root locus
T=feedback(K*L,1);

figure(3)
step(T)
stepinfo(T)

%% 10.4 RL+lead
clc;clear;close all;
%RL + phase lead
G=tf(40,[1 2 0]);
zeta=0.4;
figure;
rlocus(G);
sgrid(zeta,10^4);
%z p at 0 -2

%so choose z p left
z=10;
p=50;
Gc=tf([1 z],[1 p]);
L=Gc*G;

figure;
rlocus(L);
sgrid(zeta,10^4)

%watch new RL and choose K
K=74;
my_ratio=K*z/p      % check if my_ratio >= 1
T=feedback(K*L,1);
stepinfo(T)

