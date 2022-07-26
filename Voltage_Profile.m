%SYDE 351 Final Project
%Group 27
%Voltage Profile
%Create Voltage Profile

%This file creates a trapezoidal voltage profile

function [t_input, V_input] = Voltage_Profile(t_profile, V_max)

    %defines the motion parameter
    t_step = t_profile(1);
    t_wait_start = t_profile(2);
    t_accel = t_profile(3);
    t_steady = t_profile(4);
    t_decel = t_profile(5);
    t_wait_end = t_profile(6);

    %creates wait time signal    
    t_input = linspace(0, t_wait_start, (t_wait_start/t_step) + 1);
    V_input = linspace(0, 0, (t_wait_start/t_step) + 1);
    
    %creates acceleration time signal
    t_temp = linspace(0, t_accel, (t_accel/t_step) + 1);
    V_temp = linspace(0, V_max, (t_accel/t_step) + 1);
    
    t_temp = t_temp + t_input(end);
    
    t_input(end) = [];
    V_input(end) = [];
    
    t_input = cat(2, t_input, t_temp);
    V_input = cat(2, V_input, V_temp);

    %creates skew time signal
    t_temp = linspace(0, t_steady, (t_steady/t_step) + 1);
    V_temp = linspace(V_max, V_max, (t_steady/t_step) + 1);
    
    t_temp = t_temp + t_input(end);
    
    t_input(end) = [];
    V_input(end) = [];
    
    t_input = cat(2, t_input, t_temp);
    V_input = cat(2, V_input, V_temp);
    
    %creates deceleration time signal
    t_temp = linspace(0, t_decel, (t_decel/t_step) + 1);
    V_temp = linspace(V_max, 0, (t_decel/t_step) + 1);
    
    t_temp = t_temp + t_input(end);
    
    t_input(end) = [];
    V_input(end) = [];
    
    t_input = cat(2, t_input, t_temp);
    V_input = cat(2, V_input, V_temp);
    
    %creates wait time signal    
    t_temp = linspace(0, t_wait_end, (t_wait_end/t_step) + 1);
    V_temp = linspace(0, 0, (t_wait_end/t_step) + 1);
    
    t_temp = t_temp + t_input(end);
    
    t_input(end) = [];
    V_input(end) = [];
    
    t_input = cat(2, t_input, t_temp);
    V_input = cat(2, V_input, V_temp);

end

