% Control System Final Exam

%% Final_4

G = tf([1 4], conv(conv([1 0.17], [0.14 1]), [1 13]));
K = 130;
L = K*G;
figure(1)
margin(L)

wc = 21.2; % select wc based on phase = -130
M = 1.6; % attenuation dB
alpha = 10^(M/20);
z = wc/10
Gc = K*1/z*tf([1 z], [1 0]);
L = Gc*G;
figure(2)
margin(L)

T = feedback(L, 1);
stepinfo(T)
figure(3)
step(T)

e_ss = evalfr(T-1, 0)

K = K*1/z