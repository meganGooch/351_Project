%SYDE 351 Final Projct 
%Group 27
%Task 4b

%Assumptions: 
%   1) The floor signal starts flat for 2m
%   2) Each wheel recieves the signal 
%   3) The signal will represent the vertical displacement of the wheel 
%   4) The wheel is assumed to be rigid 

%floor dimensions given in m
threshold_width = 0.05;
threshold_height = 0.03;
floor_length = 5;
start_distance = 1;
spill_limit = 0.005;

x = linspace(0, floor_length, 1000);
t=x;
y = zeros(size(x));

for i = 1:size(y, 2)
    if ((start_distance <= x(i)) && (x(i) <= start_distance + threshold_width))
        y(i) = (x(i) - start_distance) * 2 * pi / threshold_width;
        y(i) = (1 - cos(y(i))) * 0.5 * threshold_height;
    else
        y(i) = 0;    
    end
end

plot(x, y)

t = t';
y = y';

floorSignal3 = [t, y];

simulation = sim("Task_2");

Q = simulation.output;
t_simulation = Q.time;
y_simulation = Q.Data(:,1);
d_simulation = Q.Data(:,2);
x_simulation = Q.Data(:,3);

if max(x_simulation) > spill_limit
   disp('fail')
end 
 
out = max(x_simulation)


%find square wave parameters
% duty_cycle = threshold_width/(floor_length + threshold_width)*100;

%create the plot
% syms x;
% y = piecewise(x<start_distance, 0,(start_distance<x)&(x<start_distance+threshold_width), (threshold_height*sin(pi/threshold_width*(x-2)).^2), (x>start_distance+threshold_width)&(x<floor_length), 0);
% fplot (x,y)
