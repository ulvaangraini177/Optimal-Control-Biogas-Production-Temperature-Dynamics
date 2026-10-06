%% =========================================================
% Control Variables: u1(t), u2(t), and u3(t)
% ==========================================================

% Time-varying control profiles
u1 = exp(-0.03 * t_eval) + 0.05 * sin(0.25 * t_eval);

u2 = exp(-0.02 * t_eval) ...
    + 0.04 * sin(0.20 * t_eval + 1);

u3 = exp(-0.025 * t_eval) ...
    + 0.03 * sin(0.30 * t_eval + 2);


%% =========================================================
% Control Constraints
% ==========================================================

% Restrict control variables to the interval [0, 1]
u1 = max(0, min(u1, 1));
u2 = max(0, min(u2, 1));
u3 = max(0, min(u3, 1));


%% =========================================================
% Plot Control Variables
% ==========================================================

figure;

plot(t_eval, u1, ...
    'b-', 'LineWidth', 2, 'DisplayName', 'u_1(t)');
hold on;

plot(t_eval, u2, ...
    'g-', 'LineWidth', 2, 'DisplayName', 'u_2(t)');

plot(t_eval, u3, ...
    'm-', 'LineWidth', 2, 'DisplayName', 'u_3(t)');

xlabel('Time (t)');
ylabel('Control Intensity');
title('Fluctuation of Control Variables');

xlim([0 100]);
ylim([0 1]);

legend('Location', 'best');
grid on;
box on;
hold off;