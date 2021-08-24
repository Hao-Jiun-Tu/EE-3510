% Control System Homework 2

clc; clear; close all;

%% Part 1. (spring-mass-damper system)
y0 = 0.15;
wn = sqrt(2); % natural frequency
zeta = [0.3 0.6 0.999]; % damping ratio
t=[0:0.1:10];

for i = 1:length(zeta)
    c=(y0/sqrt(1-zeta(i)^2)); 
    y=c*exp(-zeta(i)*wn*t).*sin(wn*sqrt(1-zeta(i)^2)*t+acos(zeta(i))); % Theta = arccos(zata)
 
    bu=c*exp(-zeta(i)*wn*t);
    bl=-bu;
    
    subplot(1,3,i)
    plot(t,y,t,bu,'--',t,bl,'--'), grid 
    xlabel('Time (s)'), ylabel('y(t) (m)') 
    legend(['\omega_n = ', num2str(wn), ',  \zeta = ', num2str(zeta(i))])

end


%% Part 2. (Example 2.19)
ng1 = [1]; dg1 = [1 10]; G1 = tf(ng1, dg1);
ng2 = [1]; dg2 = [1 1]; G2 = tf(ng2, dg2);
ng3 = [1 0 1]; dg3 = [1 4 4]; G3 = tf(ng3, dg3);
ng4 = [1 1]; dg4 = [1 6]; G4 = tf(ng4, dg4);
nh1 = [1 1]; dh1 = [1 2]; H1 = tf(nh1, dh1);
nh2 = [2]; dh2 = [1]; H2 = tf(nh2, dh2);
nh3 = [1]; dh3 = [1]; H3 = tf(nh3, dh3);
sys1 = H2/G4;
sys2 = series(G3, G4);
sys3 = feedback(sys2, H1, +1);
sys4 = series(G2, sys3);
sys5 = feedback(sys4, sys1);
sys6 = series(G1, sys5);

sys = feedback(sys6, H3) % system transfer function
TransferFunction = minreal(sys, 2.2e-5) % transfer function after pole-zero cancellation

%% Part 3. (Example 2.20)
ng1 = [10]; dg1 = [1 1]; G1 = tf(ng1, dg1);
ng2 = [1]; dg2 = [2 0.5]; G2 = tf(ng2, dg2);
ng3 = [540]; dg3 = [1]; G3 = tf(ng3, dg3);
nh1 = [0.1]; dh1 = [1]; H1 = tf(nh1, dh1);
sys1 = series(G1, G2);
sys2 = feedback(sys1, H1);
sys3 = series(sys2, G3);

sys = feedback(sys3, [1])
subplot(1,1,1)
%step(sys)
t = [0:0.005:3];
[y,t] = step(sys, t);
plot(t, y), grid
grid minor
xlabel('Time (s)'), ylabel('Wheel velocity')

