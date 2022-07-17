Task_7;

t_step = 0.05;



[t_temp, out_temp] = Trapezoidal_Map(t_step, t_accel_d, v_max, d(1));

t_in = t_temp;
v_in = out_temp; 
w_in = zeros(1, size(t_in, 2)); 

for i = 1:size(theta, 2)
    
    %turn
    [t_temp, out_temp] = Trapezoidal_Map(t_step, t_accel_omega, omega_max, theta(i));
    t_temp = t_temp + t_in(end);

    t_in(end) = [];
    v_in(end) = [];
    w_in(end) = [];

    t_in = cat(2, t_in, t_temp);
    v_in = cat(2, v_in, zeros(1, size(t_temp, 2)));
    w_in = cat(2, w_in, out_temp);

    %move
    [t_temp, out_temp] = Trapezoidal_Map(t_step, t_accel_d, v_max, d(i + 1));
    t_temp = t_temp + t_in(end);

    t_in(end) = [];
    v_in(end) = [];
    w_in(end) = [];

    t_in = cat(2, t_in, t_temp);
    v_in = cat(2, v_in, out_temp);
    w_in = cat(2, w_in, zeros(1, size(t_temp, 2)));

end

t_temp = linspace(0, 7, (7/t_step) + 1);
t_temp = t_temp + t_in(end);

t_in(end) = [];
v_in(end) = [];
w_in(end) = [];

t_in = cat(2, t_in, t_temp);
v_in = cat(2, v_in, zeros(1, size(t_temp, 2)));
w_in = cat(2, w_in, zeros(1, size(t_temp, 2)));



t_in = t_in';
v_in = v_in';
w_in = w_in';
