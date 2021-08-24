% Control System Final Exam

%% Final_3

G = tf(520, [1 7 8 0]);
K = 50*8/520
L = K*G;
figure(1)
margin(L)

wc = 0.468; % select wc based on phase = -130
M = 40.2; % attenuation dB
alpha = 10^(M/20);
z = wc/10
p = z/alpha

Gc = K*p/z*tf([1 z], [1 p]);
L = Gc*G;
figure(2)
margin(L)

T = feedback(L, 1);
e_ss = evalfr(T-1, 0)
K = K*p/z