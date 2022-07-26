%SYDE 351 Final Project
%Group 27
%Task 8
%Determining Voltage

%This file is used to define the voltage signal required for each motor, as
    %well as graph these voltages for analysis

%defines the time parameters of movement
t_profile_translational = [0.01, 1, 2, 0, 2, 1];
t_profile_rotational = [0.01, 1, 0.75, 0, 0.75, 1];

%defines the maximum velocity and angular velocity
v_max = 1;
w_max = pi/4;

%determines the input voltage required to find the desired velocities
V_max_translational = Voltage_SS_Translational(v_max);
V_max_rotational = Voltage_SS_Rotational(w_max);

%creates the voltage signals for the motor based on the movement profile
[t_in, V_r, V_l, t_profile] = Voltage_Iterator_Translational( ...
    V_max_translational, v_max, d(1), t_profile_translational);

for i = 1:size(theta, 2)

    [t_temp, V_r_temp, V_l_temp, t_profile_temp] = ...
        Voltage_Iterator_Rotational( ...
        V_max_rotational, w_max, theta(i), t_profile_rotational);

    t_profile = cat(1, t_profile, t_profile_temp);
    t_temp = t_temp + t_in(end);
    
    t_in(end) = [];
    V_r(end) = [];
    V_l(end) = [];
    
    t_in = cat(1, t_in, t_temp);
    V_r = cat(1, V_r, V_r_temp);
    V_l = cat(1, V_l, V_l_temp);
        
    [t_temp, V_r_temp, V_l_temp, t_profile_temp] = ...
        Voltage_Iterator_Translational( ...
        V_max_translational, v_max, d(i + 1), t_profile_translational);
    
    t_profile = cat(1, t_profile, t_profile_temp);
    t_temp = t_temp + t_in(end);
    
    t_in(end) = [];
    V_r(end) = [];
    V_l(end) = [];
    
    t_in = cat(1, t_in, t_temp);
    V_r = cat(1, V_r, V_r_temp);
    V_l = cat(1, V_l, V_l_temp);

end

%plots the voltage signal created above
figure('Name', 'Input Voltage vs Time', 'NumberTitle', 'off');
plot(t_in, V_r, t_in, V_l);

xlabel("Time [t]");
ylabel("Voltage [V]");
title("Input Voltage vs Time");
legend({'Right Motor Voltage','Left Motor Voltage'},'Location','southwest');

