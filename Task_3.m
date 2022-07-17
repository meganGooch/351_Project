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
grout_depth_wheel = 0.00025/2;
floor_length = 5;

%find square wave parameters
duty_cycle = tile_width/(grout_width + tile_width)*100;
period = tile_width + grout_width;

%create the plot
x = 0:0.000001:floor_length;
y = grout_depth_wheel*square(2*pi*(1/period)*x, duty_cycle)- grout_depth_wheel;
plot (x,y)

