%% 10.6 RL+phase lag
clc;clear all; close all;

G=tf(1,[1 2 0]);
figure;
rlocus(G);
zeta=0.45;       %by spec
sgrid(zeta,10^4);

%�qfigure 1��ŦXzeta��K
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

%% 10.7 lead_RL     �T��! CANT DO!
clc;clear all; close all;

G=tf(1,[1 20 100 0]);

figure(1)
rlocus(G)
zeta=0.707;       %by spec
sgrid(zeta,10^4);

z=25;
p=3;
K=2000*p/z;      %KV>=20

Gc=K*tf([1 z],[1 p]);   %�z�פW�n��K �U��rlocus�n��K
L=G*Gc;
figure;
rlocus(L/K);
sgrid(zeta,10^4);

%% 10.7 lag_RL �T��!
clc;clear all; close all;

G=tf(1,[1 20 100 0]);
figure;
rlocus(G);
zeta=0.707;       %by spec
sgrid(zeta,10^4);

K=240; %�ݹ�
alpha=2000/K; %z/p
z=0.1;          %close to origin
p=z/alpha;

Gc=K*tf([1 z],[1 p]);   %�z�פW�n��K �U��rlocus�n��K
L=G*Gc;
figure;
rlocus(L/K);
sgrid(zeta,10^4);

%% 10.8 lag_Bode
clc;clear all; close all;

K=40; %Kv>=20
G=tf(1,[1 2 0]);
figure;
margin(K*G);        %6.17�u��18�� ����! �ҥHlag���^��C ���2.4��40�� ���h��@�I!

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
margin(K*G);        %���70�ת�w_c�Mdb

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

z=0.75;         %�ۤv��
Kp=2;           %�ۤv��
Ki=z*Kp;

p=0;            %pole=0�T�w
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



