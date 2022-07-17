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
threshold_height = 0.03/2;
floor_length = 5;
start_distance = 2;

%find square wave parameters
duty_cycle = threshold_width/(floor_length - start_distance)*100

%create the plot
x = 0:0.000001:floor_length;
y = threshold_height*square((x - start_distance), duty_cycle) + threshold_height;
plot (x,y)
