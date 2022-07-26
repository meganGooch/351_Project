%SYDE 351 Final Project
%Group 27
%Task 10
%Determining Acceleration and Jerk

%This file plots the acceleration and jerk of the robot across the path

%pulls t and determines dt
t = Q(:, 1);
dt = diff(t);

%pulls the velocity and angular velocity of the robot
v = Q(:, 5);
w = Q(:, 6);

%determines the acceleration and jerk of the robot
a = diff(v) ./ dt;
j = diff(a);
j = j ./ dt(1:size(j, 1));

%determines the angular acceleration and jerk of the robot
alpha = diff(w) ./ dt;
zeta = diff(alpha);
zeta = zeta ./ dt(1:size(zeta, 1));

%plots the acceleration of the robot
figure('Name', 'Acceleration vs Time', 'NumberTitle', 'off');
plot(t(1:size(a, 1)), a);
xlabel("Time [t]");
ylabel("Acceleration [m/s^2]");
title("Acceleration vs Time");

%plots the jerk of the robot
figure('Name', 'Jerk vs Time', 'NumberTitle', 'off');
plot(t(1:size(j, 1)), j);
xlabel("Time [t]");
ylabel("Jerk [m/s^3]");
title("Jerk vs Time");

%plots the angular acceleration of the robot
figure('Name', 'Angular Acceleration vs Time', 'NumberTitle', 'off');
plot(t(1:size(alpha, 1)), alpha);
xlabel("Time [t]");
ylabel("Angular Acceleration [rad/s^2]");
title("Angular Acceleration vs Time");

%plots the angular jerk of the robot
figure('Name', 'Angular Jerk vs Time', 'NumberTitle', 'off');
plot(t(1:size(zeta, 1)), zeta);
xlabel("Time [t]");
ylabel("Angular Jerk [rad/s^3]");
title("Angular Jerk vs Time");
