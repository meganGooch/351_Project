Task_7;

t_step = 0.05;

t_wait = 0.5;

t_accel_translational = 2;
t_accel_rotational = 0.25;

v_max = 3;
w_max = pi/2;

V_max_translational = Voltage_SS_Translational(v_max);
V_max_rotational = Voltage_SS_Rotational(w_max);

[t_in, V_r, V_l] = Voltage_Iterator_Translational(V_max_translational, v_max, d(1), ...
    t_step, t_wait, t_accel_translational, t_accel_translational, t_wait);

for i = 1:size(theta, 2)

    [t_temp, V_r_temp, V_l_temp] = Voltage_Iterator_Rotational(V_max_rotational, w_max, theta(i), ...
        t_step, t_wait, t_accel_rotational, t_accel_rotational, t_wait);
    
    t_temp = t_temp + t_in(end);
    
    t_in(end) = [];
    V_r(end) = [];
    V_l(end) = [];
    
    t_in = cat(1, t_in, t_temp);
    V_r = cat(1, V_r, V_r_temp);
    V_l = cat(1, V_l, V_l_temp);
    
    
    
    
    
    [t_temp, V_r_temp, V_l_temp] = Voltage_Iterator_Translational(V_max_translational, v_max, d(i + 1), ...
        t_step, t_wait, t_accel_translational, t_accel_translational, t_wait);
    
    t_temp = t_temp + t_in(end);
    
    t_in(end) = [];
    V_r(end) = [];
    V_l(end) = [];
    
    t_in = cat(1, t_in, t_temp);
    V_r = cat(1, V_r, V_r_temp);
    V_l = cat(1, V_l, V_l_temp);

end


[Q, T] = Simulate_Robot(t_in, V_r, V_l, 0, pi);

%plot(Q(:,2), Q(:,3));
plot3(Q(:,2), Q(:,3), Q(:,1));



% t_step = 0.05;
% 
% %Delay Added%
% 
% delay_time = 0.5;
% 
% t_temp = linspace(0, delay_time, (delay_time/t_step) + 1);
% 
% t_in = t_temp;
% v_in = zeros(1, size(t_temp, 2));
% w_in = zeros(1, size(t_temp, 2));
% 
% 
% %First Movement Section%
% 
% %create trapezoidal movement profile
% [t_temp, out_temp] = Trapezoidal_Map(t_step, t_accel_d, v_max, d(1));
% t_temp = t_temp + t_in(end);
% 
% 
% %remove last element of list for concatenation
% t_in(end) = [];
% v_in(end) = [];
% w_in(end) = [];
% 
% %concatenate calculated values
% t_in = cat(2, t_in, t_temp);
% v_in = cat(2, v_in, out_temp);
% w_in = cat(2, w_in, zeros(1, size(t_temp, 2)));
% 
% %Next Movement Sections%
% 
% %initialize loop
% for i = 1:size(theta, 2)
%     
%     %turning profile
%     [t_temp, out_temp] = Trapezoidal_Map(t_step, t_accel_omega, omega_max, theta(i));
%     t_temp = t_temp + t_in(end);
%     
%     %remove last element of list for concatenation
%     t_in(end) = [];
%     v_in(end) = [];
%     w_in(end) = [];
%     
%     %concatenate calculated values
%     t_in = cat(2, t_in, t_temp);
%     v_in = cat(2, v_in, zeros(1, size(t_temp, 2)));
%     w_in = cat(2, w_in, out_temp);
% 
%     %movement profile
%     [t_temp, out_temp] = Trapezoidal_Map(t_step, t_accel_d, v_max, d(i + 1));
%     t_temp = t_temp + t_in(end);
% 
%     %remove last element of list for concatenation
%     t_in(end) = [];
%     v_in(end) = [];
%     w_in(end) = [];
% 
%     %concatenate calculated values
%     t_in = cat(2, t_in, t_temp);
%     v_in = cat(2, v_in, out_temp);
%     w_in = cat(2, w_in, zeros(1, size(t_temp, 2)));
% 
% end
% 
% 
% %Delay Added%
% 
% 
% t_temp = linspace(0, delay_time, (delay_time/t_step) + 1);
% t_temp = t_temp + t_in(end);
% 
% t_in(end) = [];
% v_in(end) = [];
% w_in(end) = [];
% 
% t_in = cat(2, t_in, t_temp);
% v_in = cat(2, v_in, zeros(1, size(t_temp, 2)));
% w_in = cat(2, w_in, zeros(1, size(t_temp, 2)));
% 
% t_in = t_in';
% v_in = v_in';
% w_in = w_in';
