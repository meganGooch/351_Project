%SYDE 351 Final Projct 
%Group 27
%Task 3

%Assumptions: 
%   1) The floor signal starts at the edge of a tile 
%   2) Each wheel recieves the signal 
%   3) The signal will represent the vertical displacement of the wheel 
%   4) The wheel is assumed to be rigid 

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
x = 0:0.0025:floor_length;
y = grout_depth/2*square(2*pi*(1/period)*x, duty_cycle)-grout_depth/2;

%plot the graph 
plot (x,y);
grid on;

%test the vertical displacment in the vibration simulation 
t = x;
[t_simulation, y_simulation, d_simulation, x_simulation, result] = run_vibration_simulation(t, y);

%check if the drink spills
disp(result);

