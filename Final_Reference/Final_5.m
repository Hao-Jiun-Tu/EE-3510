% Control System Final Exam

% Final_5 (a)
zeta = 0.69;
PO = 100*exp(-zeta*pi/ (1-zeta^2)^0.5)

G = tf([1], conv([1 0.1], [1 4]));
figure(1)
rlocus(G)
sgrid(zeta, 10^3);

z = 0.5;
Gc = tf([1 z], [1 0]);
L = G*Gc;
figure(2);
rlocus(L)
sgrid(zeta, 10^3);

K =7; L = K*L;
T = feedback(L, 1);
stepinfo(T)
figure(3)
step(T)

% Final_5 (b)
Gp = tf([z], [1 z]);
T = series(T, Gp);
stepinfo(T)
figure(4)
step(T)


