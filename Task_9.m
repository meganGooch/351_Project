%SYDE 351 Final Project
%Group 27
%Task 9
%Determining Motor Torque and Traversed Path

%This file is used to find the path traversed by the robot using the
    %previously created signals, as well as the motor torques created

%simulates the model and pulls the relevant data 
[Q, T] = Simulate_Robot(t_in, V_r, V_l, 0, pi);

%plots the robot path
figure('Name', 'Robot Path', 'NumberTitle', 'off');
plot(Q(:,2), Q(:,3));
xlabel("X [m]");
ylabel("Y [m]");
title("Robot Path");

%plots the robot path vs time
figure('Name', 'Robot Path vs Time', 'NumberTitle', 'off');
plot3(Q(:,2), Q(:,3), Q(:,1));
xlabel("X [m]");
ylabel("Y [m]");
zlabel("Time [t]")
title("Robot Path vs Time");

%calculates the RMS torque
T_rms_r = rms(T(:, 2));
T_rms_l = rms(T(:, 3));

%finds the max torque required
T_req = max(T_rms_r, T_rms_l);
