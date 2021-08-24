% Control System Final Exam

%% Final_2
zeta = 0.7;
PO = 100*exp(-zeta*pi/ (1-zeta^2)^0.5)

G = tf([1], conv(conv([1 2], [1 5]), [1 8]));
K = 80*19;
L = K*G;
% rlocus(L)
margin(L)
figure(1)
% sgrid(zeta, 10^3);

z = 8
p = 0.035
% Gc = tf([1 z], [1 p]);
Gc = K*p/z*tf([1 z], [1 p]);
L = Gc*G;
figure(2)
margin(L)
% rlocus(L)
% sgrid(zeta, 10^3);

T = feedback(L, 1);
stepinfo(T)
figure(2)
step(T)

e_ss = evalfr(T-1, 0)

K = 80*19*p/z
