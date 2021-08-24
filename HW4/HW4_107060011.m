% Control System Homework 4

close all; clear;
%% Problem 1
% initial parameter
g = 9.8; l = 0.4; m = 0.01; M = 2.5;
% system matrix
A = [0 1 0 0; 0 0 -m*g/M 0; 0 0 0 1; 0 0 g/l 0];
B = [0; 1/M; 0; -1/(M*l)];
C1 = [0 0 1 0]; C2 = [0 0 1 1]; C3 = [0 1 1 1];
D = [0];
K = [-15 -40 -100];
sys1 = tf(ss(A,B,C1,D))
sys2 = tf(ss(A,B,C2,D))
sys3 = tf(ss(A,B,C3,D))

%% Problem 2
tspan = [0 20]; % time interval 0s-20s
Cini = [0; 0; 0; 0]; % initial condition

C = [0 0 1 0;
     0 0 1 1; 
     0 1 1 1];
K = [-15 -40 -100];

for i = 1:3
    % Solve x'(t) = Ax(t) + Bu(t)
    [t1, x1] = ode45(@(t, x) odef(t, x, C(1,:), K(i)), tspan, Cini);
    [t2, x2] = ode45(@(t, x) odef(t, x, C(2,:), K(i)), tspan, Cini);
    [t3, x3] = ode45(@(t, x) odef(t, x, C(3,:), K(i)), tspan, Cini);
    
    % (x1, x2, x3, x4) = (y, y', theta, theta')
    y1 = C1.*x1; y1_p = y1(:, 1); y1_theta = y1(:, 3);
    y2 = C2.*x2; y2_p = y2(:, 1); y2_theta = y2(:, 3);
    y3 = C3.*x3; y3_p = y3(:, 1); y3_theta = y3(:, 3);
    
    % Output = Cx(t) + Du(t)
    y1_sum = y1(:, 1) + y1(:, 2) + y1(:, 3) + y1(:, 4);
    y2_sum = y2(:, 1) + y2(:, 2) + y2(:, 3) + y2(:, 4);
    y3_sum = y3(:, 1) + y3(:, 2) + y3(:, 3) + y3(:, 4);

    figure; sgtitle(['K = ', num2str(K(i))]);
    subplot(3, 1, 1); 
    plot(t1, y1_p,'DisplayName', 'Position', 'Linewidth', 2); hold on;
    plot(t1, y1_theta, 'DisplayName', 'Theta', 'Linewidth', 2); hold off;
    title(['C = [ ', num2str(C(1,:)), ' ]']); legend;
    
    subplot(3, 1, 2);
    plot(t2, y2_p, 'DisplayName', 'Position', 'Linewidth', 2); hold on;
    plot(t2, y2_theta, 'DisplayName', 'Theta', 'Linewidth', 2);hold off;
    title(['C = [ ', num2str(C(2,:)), ' ]']); legend;

    subplot(3, 1, 3); 
    plot(t3, y3_p, 'DisplayName', 'Position', 'Linewidth', 2); hold on;
    plot(t3, y3_theta, 'DisplayName', 'Theta', 'Linewidth', 2); hold off;
    title(['C = [ ', num2str(C(3,:)), ' ]']); legend;
    xlabel('Time (t)');

    figure; sgtitle(['K = ', num2str(K(i))]);
    subplot(3, 1, 1);
    plot(t1, y1_sum, 'DisplayName', 'y(t)', 'Linewidth', 2); 
    title(['C = [ ', num2str(C(1,:)), ' ]']);
    xlabel('Time (t)'); ylabel('y(t)');
    subplot(3, 1, 2);
    plot(t2, y2_sum, 'DisplayName', 'y(t)', 'Linewidth', 2); 
    title(['C = [ ', num2str(C(2,:)), ' ]']);
    xlabel('Time (t)'); ylabel('y(t)');
    subplot(3, 1, 3);
    plot(t3, y3_sum, 'DisplayName', 'y(t)', 'Linewidth', 2); 
    title(['C = [ ', num2str(C(3,:)), ' ]']);
    xlabel('Time (t)'); ylabel('y(t)');
end

function dx = odef(t, x, C, K)
    % initial parameter
    g = 9.8; l = 0.4; m = 0.01; M = 2.5;
    % system matrix
    A = [0 1 0 0; 0 0 -m*g/M 0; 0 0 0 1; 0 0 g/l 0];
    B = [0; 1/M; 0; -1/(M*l)];
    
    pulse = rectangularPulse(0, 0.1, t);
    Gc = (0-(C*x+pulse))*K;
    u = Gc*heaviside(t);
    dx = A*x + B*u;
end
