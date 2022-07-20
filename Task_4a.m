%SYDE 351 Final Projct 
%Group 27
%Task 4a

%Assumptions: 
%   1) The floor signal starts flat for 2m
%   2) Each wheel recieves the signal 
%   3) The signal will represent the vertical displacement of the wheel 
%   4) The wheel is assumed to be rigid 

%floor dimensions given in m
threshold_width = 0.05;
threshold_height = 0.03;
floor_length = 5;
start_distance = 0;

%find square wave parameters
% duty_cycle = threshold_width/(floor_length - start_distance)*100;

%create the plot
%x = 0:0.000001:floor_length;
%y = threshold_height*square((x - start_distance), duty_cycle) + threshold_height;
%plot (x,y)

x = linspace(0, floor_length, 1000);
y = zeros(size(x));

for i = 1:size(y, 2)
    if ((start_distance <= x(i)) && (x(i) <= start_distance + threshold_width))
        y(i) = threshold_height;
    else
        y(i) = 0;    
    end
end

plot(x, y);


% 
% syms x;
% y = piecewise((x<start_distance), 0,(start_distance<x)&(x<start_distance+threshold_width),threshold_height, (x>start_distance+threshold_width)&(x<floor_length), 0);
% fplot (x,y)