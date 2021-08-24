%% 10.6 RL+phase lag
clc;clear all; close all;

G=tf(1,[1 2 0]);
figure;
rlocus(G);
zeta=0.45;       %by spec
sgrid(zeta,10^4);

%從figure 1找符合zeta的K
K=4.5;
alpha=40/K;
z=0.1;
p=z/alpha;

Gc=K*tf([1 z],[1 p]);
L=Gc*G;
figure(2)
rlocus(L)
zeta=0.45;       %by spec
sgrid(zeta,10^4);

%% 10.7 lead_RL     三階! CANT DO!
clc;clear all; close all;

G=tf(1,[1 20 100 0]);

figure(1)
rlocus(G)
zeta=0.707;       %by spec
sgrid(zeta,10^4);

z=25;
p=3;
K=2000*p/z;      %KV>=20

Gc=K*tf([1 z],[1 p]);   %理論上要乘K 下面rlocus要除K
L=G*Gc;
figure;
rlocus(L/K);
sgrid(zeta,10^4);

%% 10.7 lag_RL 三階!
clc;clear all; close all;

G=tf(1,[1 20 100 0]);
figure;
rlocus(G);
zeta=0.707;       %by spec
sgrid(zeta,10^4);

K=240; %看圖
alpha=2000/K; %z/p
z=0.1;          %close to origin
p=z/alpha;

Gc=K*tf([1 z],[1 p]);   %理論上要乘K 下面rlocus要除K
L=G*Gc;
figure;
rlocus(L/K);
sgrid(zeta,10^4);

%% 10.8 lag_Bode
clc;clear all; close all;

K=40; %Kv>=20
G=tf(1,[1 2 0]);
figure;
margin(K*G);        %6.17只有18度 不夠! 所以lag往回找。 找到2.4有40度 但多找一點!

w_c=1.6;            %wc
attenuation_db=20;  %M

Gc = Bode_lag(K,w_c,attenuation_db);
L=G*Gc;
figure;
margin(L);

%% 10.9 lag_Bode
clc;clear all; close all;

K=2000; %Kv>=20
G=tf(1,[1 20 100 0]);
figure;
margin(K*G);        %找到70度的w_c和db

w_c=1.2;                %wc
attenuation_db=24.3;    %M

Gc = Bode_lag(K,w_c,attenuation_db);
L=G*Gc;
figure;
margin(L);

%% 10.5  PI conpensator
clc;clear all; close all;

G=tf(1,[1 2.5 1]);
figure;
rlocus(G);
zeta=0.6;
sgrid(zeta,10^4)

zeta=0.6;      %change zeta to get a fine PO
PO=100*exp(  -zeta*pi/   (1-zeta^2)^0.5)

z=0.75;         %自己取
Kp=2;           %自己取
Ki=z*Kp;

p=0;            %pole=0固定
Gc=Kp*tf([1 z],[1 p]);
L=Gc*G;
figure;
rlocus(L);
zeta=0.6;
sgrid(zeta,10^4);

K=1;
T=feedback(K*L,1);

figure;
step(T)
S=stepinfo(T)
ess=evalfr(T-1,0)



