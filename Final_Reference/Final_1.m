% Control System Final Exam

%% Final_1 (a)

G = tf(3.6, conv(conv([1 0], [0.9 1]), [0.04 1]));
K = 5; L = K*G;
figure(1)
margin(L)

wc = 0.161; % select wc based on phase = -130
M = 40.9; % attenuation dB
alpha = 10^(M/20);
z = wc/10;
p = z/alpha;

Gc = K*p/z*tf([1 z], [1 p]);
L = Gc*G
figure(2)
margin(L)

%% Final_1 (b)

G = tf(3.6, conv(conv([1 0], [0.9 1]), [0.04 1]));
K = 5; L = K*G;
figure(1)
margin(L)

% Compensation 1
phi_m1 = (65 - (4.35)) + 10;
phi_m1 = phi_m1*pi/180;
alpha1 = (1+sin(phi_m1))/(1-sin(phi_m1));
Ggc1 = -10*log10(alpha1)
figure(2)
bode(L); % decide wn based on Ggc
wn1 = 10.1;

p1 = wn1*alpha1^0.5;
z1 = p1/alpha1;

Gc1 = K*p1/z1*tf([1 z1], [1 p1]);
L = Gc1*G;
figure(3)
margin(L)

% Compensation 2
phi_m2 = (77 - 53) + 25;
phi_m2 = phi_m2*pi/180;
alpha2 = (1+sin(phi_m2))/(1-sin(phi_m2));
Ggc2 = -10*log10(alpha2)
figure(4)
bode(L); % decide wn based on Ggc
wn2 = 21.9;

p2 = wn2*alpha2^0.5;
z2 = p2/alpha2;

Gc2 = p2/z2*tf([1 z2], [1 p2]);
L = Gc1*Gc2*G;
figure(5)
margin(L)
