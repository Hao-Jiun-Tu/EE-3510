% Control System Final Exam

zeta = 0.6;
PO = 100*exp(-zeta*pi/ (1-zeta^2)^0.5)

G = tf([3.8], conv([1 0.17], [0.14 1]));
figure(1)
rlocus(G)
sgrid(zeta, 10^3);

K = 1.31; L = K*G;
T = feedback(L, 1);
stepinfo(T)
figure(2)
step(T)



