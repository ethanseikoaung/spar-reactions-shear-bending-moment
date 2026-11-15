clc, clear

% Spar Geometry
l = 1.077; % Semi-spar length in [m]

% Estimated Lift
max_g = 1.5; % Load Factor
weight = 42 * 4.44822; %lbs to N
lift = max_g * weight; % [N] (Lift Required)
fprintf("Estimated Required Lift: %6.4f\n",lift);

top_lift = lift*0.65/2; % Estimated lift on the top left wing (65% of total lift)
bottom_lift = lift*0.35/2; % Estimated lift on the bottom left wing  (35% of total lift)


Lmax_top = (4*top_lift)/(pi*l); %Maximum lift on the top spar
Lmax_bottom = (4*bottom_lift)/(pi*l); %Minimum lift on the bottom spar

% Estimated weight of a spar cross-section (linear)
w_0 = 3.3; %[N/m]

%------------------------------------------------------------

% Calculating reactions at the root of the spars

% Reactions at root of top spar
R_y_top = w_0*l - Lmax_top*l*pi/4; %Vertical Reaction
M_R_top = w_0*(l^2)/2 - Lmax_top*(l^2)/3; %Resultant Moment at root

% Reactions at root for bottom spar
R_y_bottom = w_0*l - Lmax_bottom*l*pi/4; %Vertical Reaction
M_R_bottom = w_0*(l^2)/2 - Lmax_bottom*(l^2)/3; %Resultant Moment at root


%------------------------------------------------------------

% Calculating span-wise lift, shear, moment distribution

x = linspace(0,l,100);

% Calculating Lift Distributions
L_x_top = Lmax_top*(1-(x./l).^2).^(1/2);
L_x_bottom = Lmax_bottom*(1-(x./l).^2).^(1/2);

% Calculating Shear Distributions
V_x_top = -(Lmax_top*0.5*l*(acos(x./l)-(x/l).*sqrt(1-(x/l).^2)-pi/2) - R_y_top + w_0*x);
V_x_bottom = -(Lmax_bottom*0.5*l*(acos(x./l)-(x/l).*sqrt(1-(x/l).^2)-pi/2) - R_y_bottom + w_0*x);

% Bending Moment
f_top = @(s) Lmax_top*0.5*l*(acos(s./l)-(s/l).*sqrt(1-(s/l).^2)-pi/2) - R_y_top + w_0*s;
f_bottom = @(s) Lmax_bottom*0.5*l*(acos(s./l)-(s/l).*sqrt(1-(s/l).^2)-pi/2) - R_y_bottom + w_0*s;
M_x_top = arrayfun(@(s) integral(f_top, s, l), x);
M_x_bottom = arrayfun(@(s) integral(f_bottom, s, l), x);

%------------------------------------------------------------

% Plots

% Lift Distribution
figure
plot(x,L_x_top,'b-',x,L_x_bottom,'r-','LineWidth',1.5);
grid on;
xlabel('Spanwise Position, x (m)');
ylabel('Lift Distribution (N/m)');
title("Lift Distribution along Semi-span");
legend('Top Spar','Bottom Spar');

% Shear Diagram
figure 
plot(x,V_x_top,'b-',x,V_x_bottom,'r-','LineWidth',1.5);
grid on;
xlabel('Spanwise Position, x (m)');
ylabel('Shear Force (N)');
title("Shear Distribution along Semi-span");
legend('Top Spar','Bottom Spar');

% Bending Moment Diagram
figure 
plot(x,M_x_top,'b-',x,M_x_bottom,'r-','LineWidth',1.5);
grid on;
xlabel('Spanwise Position, x (m)');
ylabel('Bending Moment (N·m)');
title("Moment along Semi-span");
legend('Top Spar','Bottom Spar');

% Report Critical Values
fprintf("Estimated Required Lift: %6.4f N \n",lift);
fprintf("Lift Required on top left wing: %6.4f N \n",top_lift);
fprintf("Lift Required on bottom left wing: %6.4f N \n", bottom_lift);
fprintf("------------------------------------------------------\n");
fprintf("Reactions at Root\n");
fprintf("Top spar: Ry = %6.4f N, M = %6.4f N·m\n", R_y_top, M_R_top);
fprintf("Bottom spar: Ry = %6.4f N, M = %6.4f N·m\n", R_y_bottom, M_R_bottom);