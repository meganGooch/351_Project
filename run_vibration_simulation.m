function [t_simulation, y_simulation, d_simulation, x_simulation, result] = run_vibration_simulation(t_points, y_points)
    
    %invert the format of the points 
    t = t_points';
    y = y_points';

    %pass in the set of points for the vertical displacement signal into
    %the vibration simulation 
    assignin('base', 'input_signal', [t, y]);
    simulation = sim("Task_2");
    
    %get the outputs of the simulation 
    Q = simulation.output;
    t_simulation = Q.time;
    y_simulation = Q.Data(:,1);
    d_simulation = Q.Data(:,2);
    x_simulation = Q.Data(:,3);

    %a drink cannot spill more than 5mm vertically 
    spill_limit = 0.005;

    %if the largest displacement at any time is larger that 5mm, then the
    %simulation parameters fail, otherwise the simulation parameters pass 
    if (max(x_simulation)-min(x_simulation)) > spill_limit
        result = 'fail';
    else
        result = 'pass';
    end 
disp(max(x_simulation)-min(x_simulation))
end