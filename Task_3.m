%SYDE 351 Final Projct 
%Group 27
%Task 3

clear;
clc; 

%floor dimensions given in m
tile_width = 0.3048;
grout_width = 0.01;
grout_depth = 0.005;
floor_length = 5;

%find square wave parameters
duty_cycle = tile_width/(grout_width + tile_width)*100;
period = tile_width + grout_width;

%graph of vertical displacment in terms of horizontal displacement 
x = 0:0.001:floor_length;
y = grout_depth/2*square(2*pi*(1/period)*x, duty_cycle)-grout_depth/2;

%plot the graph 
plot (x,y);
grid on;
title('Tile Floor Displacement Signal');
xlabel('Horzontal Displacement [m]');
ylabel('Vertical Displacement [m]');

%test the vertical displacment in the vibration simulation 
t = x;
[t_simulation, y_simulation, d_simulation, x_simulation, result] = run_vibration_simulation(t, y);

%check if the drink spills
disp(result);

