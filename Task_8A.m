Parameter_Setup;

speed_target = 3;

speed_error_allowable = 0.01;     %percentage acceptable for variation
change_error_allowable = 0.01;
iterations_max = 100;

initial_angle = 0;
initial_velocity = 0;

%determine voltage for steady state speed%

final_time = 1;
t_step = 1;

speed_ss_prev = 0;
speed_ss = 0;

condition = 0;

%midpoint solution%

%find upper bound

%create initial bounds
voltage_lower = 0;
voltage_upper = 1;

iterations = 0;

while ((condition == 0) && (iterations < iterations_max))

    iterations = iterations + 1;

    time_set = linspace(0, final_time, 1 + (final_time/t_step));

    voltage_set = zeros(1, size(time_set, 2));
    voltage_set = voltage_set + voltage_upper;
    
    time_set = time_set';
    voltage_set = voltage_set';
    
    outputs = Simulate_Robot(time_set, voltage_set, voltage_set, 0, 0);

    speed_upper = outputs(end, 2);

    if (speed_upper < speed_target)
        voltage_upper = voltage_upper * 2;

    else
        condition = 1;

    end
end

iterations = 0;
speed_error = 1;

while ((speed_error > speed_error_allowable) && (iterations < iterations_max))

    iterations = iterations + 1;

    voltage_middle = 0.5 * (voltage_lower + voltage_upper);

    time_set = linspace(0, final_time, 1 + (final_time/t_step));

    voltage_set = zeros(1, size(time_set, 2));
    voltage_set = voltage_set + voltage_middle;
    
    time_set = time_set';
    voltage_set = voltage_set';
    
    outputs = Simulate_Robot(time_set, voltage_set, voltage_set, 0, 0);

    change_error = abs((outputs(end, 4) - outputs(end - 1, 4)) / outputs(end, 4));
    
    if (change_error > change_error_allowable)
        final_time = final_time + 1;
    
    elseif (speed_middle < speed_target)
        voltage_lower = voltage_middle;
        speed_error = (speed_middle - speed_target) / speed_target;
        speed_error = abs(speed_error);

    else
        voltage_upper = voltage_middle;
        speed_error = (speed_middle - speed_target) / speed_target;
        speed_error = abs(speed_error);

    end
end
