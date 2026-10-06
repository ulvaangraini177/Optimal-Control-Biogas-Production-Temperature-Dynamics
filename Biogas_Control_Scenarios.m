%% =========================================================
% 1. CLEAR WORKSPACE
% ==========================================================

clear;
clc;
close all;


%% =========================================================
% 2. PARAMETERS FROM NUGRAHENI (2024)
% ==========================================================

alpha1 = 0.26;
l      = 3.00;
v1     = 5.00;
p      = 4.00;
e      = 2.00;
c      = 0.35;
h      = 3.00;
o      = 1.00;
alpha  = 0.54;
v2     = 7.00;


%% =========================================================
% 3. TEMPERATURE PARAMETERS
% ==========================================================

Sa = 35.0;       % Reference temperature (°C)
qH = 0.50;       % Heating coefficient
kL = 0.10;       % Heat loss coefficient


%% =========================================================
% 4. INITIAL CONDITIONS AND SIMULATION TIME
% ==========================================================

P0 = 0.1;
E0 = 0.1;
T0 = 0.1;
S0 = 30.0;

y0 = [P0; E0; T0; S0];

% Simulation time
t_start = 0;
t_end   = 100;

t_eval = linspace(t_start, t_end, 500);


%% =========================================================
% 5. DIFFERENTIAL EQUATION MODEL
% ==========================================================

% The model is defined at the end of this script.


%% =========================================================
% 6. SIMULATION FUNCTION
% ==========================================================

% The model is solved using ode45 for each control scenario.


%% =========================================================
% 7. RUN FIVE CONTROL SCENARIOS
% ==========================================================

% Scenario 1: Without Control
[t_without, sol_without] = ode45( ...
    @(t,y) model(t,y,alpha1,l,v1,p,e,c,h,o,alpha,v2,Sa,qH,kL,0,0,0), ...
    t_eval, y0);

% Scenario 2: u1 Only
[t_u1, sol_u1] = ode45( ...
    @(t,y) model(t,y,alpha1,l,v1,p,e,c,h,o,alpha,v2,Sa,qH,kL,0.8,0,0), ...
    t_eval, y0);

% Scenario 3: u2 Only
[t_u2, sol_u2] = ode45( ...
    @(t,y) model(t,y,alpha1,l,v1,p,e,c,h,o,alpha,v2,Sa,qH,kL,0,0.8,0), ...
    t_eval, y0);

% Scenario 4: u3 Only
[t_u3, sol_u3] = ode45( ...
    @(t,y) model(t,y,alpha1,l,v1,p,e,c,h,o,alpha,v2,Sa,qH,kL,0,0,0.8), ...
    t_eval, y0);

% Scenario 5: All Controls
[t_all, sol_all] = ode45( ...
    @(t,y) model(t,y,alpha1,l,v1,p,e,c,h,o,alpha,v2,Sa,qH,kL,0.8,0.8,0.8), ...
    t_eval, y0);


%% =========================================================
% 8. GRAPH 1: WITHOUT CONTROL
% ==========================================================

figure;

plot(t_without, sol_without(:,1), ...
    'r-', 'LineWidth', 2, 'DisplayName', 'P(t)');
hold on;

plot(t_without, sol_without(:,2), ...
    'b-', 'LineWidth', 2, 'DisplayName', 'E(t)');

plot(t_without, sol_without(:,3), ...
    'g-', 'LineWidth', 2, 'DisplayName', 'T(t)');

plot(t_without, sol_without(:,4), ...
    'k-', 'LineWidth', 2, 'DisplayName', 'S(t)');

xlabel('Time (t)');
ylabel('State Variables');
title('Dynamics of the Four State Variables - Without Control');

xlim([0 100]);

legend('Location', 'best');
grid on;
box on;
hold off;


%% =========================================================
% 9. GRAPH 2: u1 ONLY
% ==========================================================

figure;

plot(t_u1, sol_u1(:,1), ...
    'r-', 'LineWidth', 2, 'DisplayName', 'P(t)');
hold on;

plot(t_u1, sol_u1(:,2), ...
    'b-', 'LineWidth', 2, 'DisplayName', 'E(t)');

plot(t_u1, sol_u1(:,3), ...
    'g-', 'LineWidth', 2, 'DisplayName', 'T(t)');

plot(t_u1, sol_u1(:,4), ...
    'k-', 'LineWidth', 2, 'DisplayName', 'S(t)');

xlabel('Time (t)');
ylabel('State Variables');
title('Dynamics of the Four State Variables - Control u_1 Only');

xlim([0 100]);

legend('Location', 'best');
grid on;
box on;
hold off;


%% =========================================================
% 10. GRAPH 3: u2 ONLY
% ==========================================================

figure;

plot(t_u2, sol_u2(:,1), ...
    'r-', 'LineWidth', 2, 'DisplayName', 'P(t)');
hold on;

plot(t_u2, sol_u2(:,2), ...
    'b-', 'LineWidth', 2, 'DisplayName', 'E(t)');

plot(t_u2, sol_u2(:,3), ...
    'g-', 'LineWidth', 2, 'DisplayName', 'T(t)');

plot(t_u2, sol_u2(:,4), ...
    'k-', 'LineWidth', 2, 'DisplayName', 'S(t)');

xlabel('Time (t)');
ylabel('State Variables');
title('Dynamics of the Four State Variables - Control u_2 Only');

xlim([0 100]);

legend('Location', 'best');
grid on;
box on;
hold off;


%% =========================================================
% 11. GRAPH 4: u3 ONLY
% ==========================================================

figure;

plot(t_u3, sol_u3(:,1), ...
    'r-', 'LineWidth', 2, 'DisplayName', 'P(t)');
hold on;

plot(t_u3, sol_u3(:,2), ...
    'b-', 'LineWidth', 2, 'DisplayName', 'E(t)');

plot(t_u3, sol_u3(:,3), ...
    'g-', 'LineWidth', 2, 'DisplayName', 'T(t)');

plot(t_u3, sol_u3(:,4), ...
    'k-', 'LineWidth', 2, 'DisplayName', 'S(t)');

xlabel('Time (t)');
ylabel('State Variables');
title('Dynamics of the Four State Variables - Control u_3 Only');

xlim([0 100]);

legend('Location', 'best');
grid on;
box on;
hold off;


%% =========================================================
% 12. GRAPH 5: ALL CONTROLS
% ==========================================================

figure;

plot(t_all, sol_all(:,1), ...
    'r-', 'LineWidth', 2, 'DisplayName', 'P(t)');
hold on;

plot(t_all, sol_all(:,2), ...
    'b-', 'LineWidth', 2, 'DisplayName', 'E(t)');

plot(t_all, sol_all(:,3), ...
    'g-', 'LineWidth', 2, 'DisplayName', 'T(t)');

plot(t_all, sol_all(:,4), ...
    'k-', 'LineWidth', 2, 'DisplayName', 'S(t)');

xlabel('Time (t)');
ylabel('State Variables');
title('Dynamics of the Four State Variables - All Controls');

xlim([0 100]);

legend('Location', 'best');
grid on;
box on;
hold off;


%% =========================================================
% 13. DIFFERENTIAL EQUATION FUNCTION
% ==========================================================

function dydt = model(~, y, alpha1, l, v1, p, e, c, h, o, ...
                      alpha, v2, Sa, qH, kL, u1, u2, u3)

    % State variables
    P = y(1);
    E = y(2);
    T = y(3);
    S = y(4);

    % Temperature response function
    phi = S / Sa;

    % Differential equations
    dPdt = alpha1 + l + v1*T ...
         - (p + e*phi*(1 + u1))*P;

    dEdt = e*phi*(1 + u1)*P ...
         - (c + h)*E + o*T;

    dTdt = (c + h)*E ...
         + p*(1 + u2)*P ...
         - alpha*T - (v2 + o)*T;

    dSdt = qH*u3 ...
         - kL*(S - Sa);

    % Return the derivatives
    dydt = [dPdt;
            dEdt;
            dTdt;
            dSdt];

end
