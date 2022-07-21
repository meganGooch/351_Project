function [t_input, V_input] = Voltage_Profile(t_step, t_wait_start, t_accel, t_steady, t_decel, t_wait_end, V_max)

    %generate accelleration curve%
    
    t_input = linspace(0, t_wait_start, (t_wait_start/t_step) + 1);
    V_input = linspace(0, 0, (t_wait_start/t_step) + 1);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    t_temp = linspace(0, t_accel, (t_accel/t_step) + 1);
    V_temp = linspace(0, V_max, (t_accel/t_step) + 1);
    
    t_temp = t_temp + t_input(end);
    
    t_input(end) = [];
    V_input(end) = [];
    
    t_input = cat(2, t_input, t_temp);
    V_input = cat(2, V_input, V_temp);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    t_temp = linspace(0, t_steady, (t_steady/t_step) + 1);
    V_temp = linspace(V_max, V_max, (t_steady/t_step) + 1);
    
    t_temp = t_temp + t_input(end);
    
    t_input(end) = [];
    V_input(end) = [];
    
    t_input = cat(2, t_input, t_temp);
    V_input = cat(2, V_input, V_temp);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    t_temp = linspace(0, t_decel, (t_decel/t_step) + 1);
    V_temp = linspace(V_max, 0, (t_decel/t_step) + 1);
    
    t_temp = t_temp + t_input(end);
    
    t_input(end) = [];
    V_input(end) = [];
    
    t_input = cat(2, t_input, t_temp);
    V_input = cat(2, V_input, V_temp);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    t_temp = linspace(0, t_wait_end, (t_wait_end/t_step) + 1);
    V_temp = linspace(0, 0, (t_wait_end/t_step) + 1);
    
    t_temp = t_temp + t_input(end);
    
    t_input(end) = [];
    V_input(end) = [];
    
    t_input = cat(2, t_input, t_temp);
    V_input = cat(2, V_input, V_temp);

end

