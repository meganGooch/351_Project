function [t, Vr, Vl] = Voltage_Iterator_Translational(V_max, v_max, d_target, t_step, t_wait_start, t_accel, t_decel, t_wait_end)

    t_final = abs(d_target/v_max);

    [t_in, V_in] = Voltage_Profile(t_step, t_wait_start, t_accel, t_final, t_decel, t_wait_end, V_max);
    
    V_in = Smooth(V_in, 11);
    V_in = Smooth(V_in, 5);

    
    t_in = t_in';
    V_in = V_in';

    if (d_target > 0)
        outputs = Simulate_Robot(t_in, V_in, V_in, 0, 0);

    else
        outputs = Simulate_Robot(t_in, -V_in, -V_in, 0, 0);

    end
    
    d_guess = outputs(end, 2);

    if (d_target > 0)
        t_final = t_final + (d_target - d_guess) / v_max;

    else
        t_final = t_final - (d_target - d_guess) / v_max;

    end
        
    [t_in, V_in] = Voltage_Profile(t_step, t_wait_start, t_accel, t_final, t_decel, t_wait_end, V_max);
    
    V_in = Smooth(V_in, 11);
    V_in = Smooth(V_in, 5);

    
    t = t_in';

    if (d_target > 0)
        Vr = V_in';

    else
        Vr = -V_in';
        
    end
        
    Vl = Vr;
end
