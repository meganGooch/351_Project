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
spill_limit = 0.005;

%find square wave parameters
duty_cycle = tile_width/(grout_width + tile_width)*100;
period = tile_width + grout_width;

%create the plot of vertical displacment in terms of horizontal
%displacement 
x = 0:0.00001:floor_length;
y = grout_depth/2*square(2*pi*(1/period)*x, duty_cycle)-grout_depth/2;

plot (x,y)
grid on;

t = x';
y = y';

floorSignal = [t, y];

simulation = sim("Task_2");

Q = simulation.output;
t_simulation = Q.time;
y_simulation = Q.Data(:,1);
d_simulation = Q.Data(:,2);
x_simulation = Q.Data(:,3);

if max(x_simulation) > spill_limit
   disp('fail')
end 

out = max(d_simulation)
