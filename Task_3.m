%SYDE 351 Final Projct 
%Group 27
%Task 3

%Assumptions: 
%   1) The floor signal starts at the edge of a tile 
%   2) Each wheel recieves the signal 
%   3) The signal will represent the vertical displacement of the wheel 
%   4) The wheel is assumed to be rigid 

%floor dimensions given in m
tile_width = 0.3048;
grout_width = 0.01;
grout_depth = 0.005;
floor_length = 5;

%find square wave parameters
duty_cycle = tile_width/(grout_width + tile_width)*100;
period = tile_width + grout_width;

%create the plot
x = 0:0.00001:floor_length;
t = 0:00001:1.66667;
y = grout_depth/2*square(2*pi*(1/period)*x, duty_cycle)-grout_depth/2;
y3 = grout_depth/2*square(2*pi*(1/period)*3*t, duty_cycle)-grout_depth/2;

k = 20;
c = 30;

% simulation = sim("Task_2");
% 
% 
% Q = simulation.out;
% t_simulation = Q.time;
% x_simulation = Q.Data(:,1);
% y_simulation = Q.Data(:,2);
% theta_simulation = Q.Data(:,3);
% v_simulation = Q.Data(:,4);
% w_simulation = Q.Data(:,5);

plot (t,y3)
grid on;

