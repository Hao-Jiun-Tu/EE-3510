% Control System Final Exam

% Final_4 (a)
zeta = 0.69;
PO = 100*exp(-zeta*pi/ (1-zeta^2)^0.5)

G = tf([1], conv([1 -3], [1 -2]));
figure(1)
rlocus(G)
sgrid(zeta, 10^3);

z = 1; p = 25;
Gc = tf([1 z], [1 p]);
L = G*Gc;
figure(2)
rlocus(L)
sgrid(zeta, 10^3);

K = 270; L = K*L;
T = feedback(L, 1);
stepinfo(T)
figure(3)
step(T)

% Final_4 (b)
Gp = tf([z], [1 z]);
T = series(T, Gp);
stepinfo(T)
figure(4)
step(T)




