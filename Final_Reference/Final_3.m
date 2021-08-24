% Control System Final Exam

zeta = 0.58;
PO = 100*exp(-zeta*pi/ (1-zeta^2)^0.5)

G = tf([3.6], conv([1 0.14], [0.1 1]));
figure(1)
rlocus(G)
sgrid(zeta, 10^3);

K = 2; L = K*G;
T = feedback(L, 1);
stepinfo(T)
figure(2)
step(T)



