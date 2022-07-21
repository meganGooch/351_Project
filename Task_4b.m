%SYDE 351 Final Projct 
%Group 27
%Task 4b

%Assumptions: 
%   1) The floor signal starts flat for 2m
%   2) Each wheel recieves the signal 
%   3) The signal will represent the vertical displacement of the wheel 
%   4) The wheel is assumed to be rigid 

clear;
clc; 

%floor dimensions given in m
threshold_width = 0.05;
threshold_height = 0.03;
floor_length = 5;
start_distance = 1;

%generate number of points in the graph
x = linspace(0, floor_length, 1000);
y = zeros(size(x));

%generate graph
for i = 1:size(y, 2)
    if ((start_distance <= x(i)) && (x(i) <= start_distance + threshold_width))
        y(i) = (x(i) - start_distance) * 2 * pi / threshold_width;
        y(i) = (1 - cos(y(i))) * 0.5 * threshold_height;
    else
        y(i) = 0;    
    end
end

%plot the graph
plot(x, y);

%test the vertical displacment in the vibration simulation 
t = x;
[t_simulation, y_simulation, d_simulation, x_simulation, result] = run_vibration_simulation(t, y);

%check if the drink spills
disp(result);
