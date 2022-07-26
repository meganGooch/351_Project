%SYDE 351 Final Project
%Group 27
%Simulate Robot
%Robot Simulation and I/O Control

%This file is used to simulate the robot

function [kin, dyn] = Simulate_Robot(t_in, Vr_in, Vl_in, initial_velocity, initial_angle)

    %assigns simulation parameters
    assignin("base", "initial_velocity", initial_velocity);
    assignin("base", "initial_angle", initial_angle);
    assignin("base", "final_time", t_in(end));
    
    Vr = [t_in, Vr_in];
    Vl = [t_in, Vl_in];
    
    assignin('base', "Vr_sim", Vr);
    assignin('base', "Vl_sim", Vl);

    %runs simulation
    results = sim("Task_1F");
    
    %formats outputs
    Q = results.Q;
    t_check = Q.time;
    x_check = Q.Data(:,1);
    y_check = Q.Data(:,2);
    theta_check = Q.Data(:,3);
    v_check = Q.Data(:,4);
    w_check = Q.Data(:,5);
    
    kin = [t_check, x_check, y_check, theta_check, v_check, w_check];

    T = results.T;
    t_check = T.time;
    tau_r = T.Data(:,1);
    tau_l = T.Data(:,2);

    dyn = [t_check, tau_r, tau_l];

end
