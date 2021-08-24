% Control System Final Exam

%% Final_1

G = tf(130, [1 7 0]);
K = 21/13
L = K*G;
figure(1)
margin(L)

wc = 4.14; % select wc based on phase = -130
M = 15.9; % attenuation dB
alpha = 10^(M/20);
z = wc/10
p = z/alpha

Gc = K*p/z*tf([1 z], [1 p]);
L = Gc*G;
figure(2)
margin(L)

K = K*p/z