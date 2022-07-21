
Task_8A;


%generate accelleration curve%

displacement_target = 15;

t_step = 0.1;

t_wait_start = 1;
t_accel = 0.5;
t_guess = 5;
t_decel = 0.5;
t_wait_end = 1;

[t_in, V_in] = Voltage_Profile(t_step, t_wait_start, t_accel, t_guess, t_decel, t_wait_end, voltage_middle);

V_in = Smooth(V_in, 3);

t_in = t_in';
V_in = V_in';

outputs = Simulate_Robot(t_in, V_in, V_in, 0, 0);

displacement_guess = outputs(end, 2);

t_final = t_guess + (displacement_target - displacement_guess) / speed_middle;

[t_in, V_in] = Voltage_Profile(t_step, t_wait_start, t_accel, t_final, t_decel, t_wait_end, voltage_middle);

V_in = Smooth(V_in, 3);

t_in = t_in';
V_in = V_in';

outputs = Simulate_Robot(t_in, V_in, V_in, 0, 0);
