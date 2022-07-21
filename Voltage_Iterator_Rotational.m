function [t, Vr, Vl] = Voltage_Iterator_Rotational(V_max, w_max, theta_target, t_step, t_wait_start, t_accel, t_decel, t_wait_end)

    t_final = abs(theta_target/w_max);

    [t_in, V_in] = Voltage_Profile(t_step, t_wait_start, t_accel, t_final, t_decel, t_wait_end, V_max);
    
    V_in = Smooth(V_in, 3);
    
    t_in = t_in';
    V_in = V_in';

    if (theta_target > 0)
        outputs = Simulate_Robot(t_in, V_in, -V_in, 0, 0);

    else
        outputs = Simulate_Robot(t_in, -V_in, V_in, 0, 0);

    end
    
    theta_guess = outputs(end, 4);

    if (theta_target > 0)
        t_final = t_final + (theta_target - theta_guess) / w_max;

    else
        t_final = t_final - (theta_target - theta_guess) / w_max;

    end
        
    [t_in, V_in] = Voltage_Profile(t_step, t_wait_start, t_accel, t_final, t_decel, t_wait_end, V_max);
    
    V_in = Smooth(V_in, 3);
    
    t = t_in';

    if (theta_target > 0)
        Vr = V_in';

    else
        Vr = -V_in';
        
    end
        
    Vl = -Vr;

end
