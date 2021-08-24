% Control System Final Exam

G = tf([1 5], [1 2 20 3]);
K = 18; L = K*G;
figure(1)
margin(L)

wc = 4.14; % select wc based on phase = -130
M = 10.8; % attenuation dB
alpha = 10^(M/20);
z = wc/10;
p = z/alpha;

Gc = K*p/z*tf([1 z], [1 p]);
L = Gc*G
figure(2)
margin(L)

T = feedback(L, 1);
stepinfo(T)
figure(3)
step(T)
