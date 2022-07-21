function V_max = Voltage_SS_Rotational(w_target)

    w_err_all = 0.01;
    ss_err_all = 0.01;
    iterations_max = 100;
    
    %determine voltage for steady state speed%
    
    t_ss = 1;
    t_step = 1;
    
    V_l = 0;
    V_u = 1;
    
    condition = 0;
    iterations = 0;
    
    while ((condition == 0) && (iterations < iterations_max))
    
        iterations = iterations + 1;
    
        t_in = linspace(0, t_ss, 1 + (t_ss/t_step));
    
        V_in = zeros(1, size(t_in, 2));
        V_in = V_in + V_u;
        
        t_in = t_in';
        V_in = V_in';
        
        outputs = Simulate_Robot(t_in, V_in, -V_in, 0, 0);
        w_cur = outputs(end, 6);
        w_prev = outputs(end - 1, 6);
    
        if (((w_cur - w_prev) / w_cur) > ss_err_all)
            t_ss = t_ss + 1;

        elseif (w_cur < w_target)
            V_u = V_u * 2;
    
        else
            condition = 1;
    
        end
    end
    
    iterations = 0;
    w_err = 1;
    
    while ((w_err > w_err_all) && (iterations < iterations_max))
    
        iterations = iterations + 1;
    
        V_max = 0.5 * (V_l + V_u);
    
        t_in = linspace(0, t_ss, 1 + (t_ss/t_step));
    
        V_in = zeros(1, size(t_in, 2));
        V_in = V_in + V_max;
        
        t_in = t_in';
        V_in = V_in';
        
        outputs = Simulate_Robot(t_in, V_in, -V_in, 0, 0);
        w_cur = outputs(end, 6);
        w_prev = outputs(end - 1, 6);
    
        ss_err = abs((w_cur - w_prev) / w_cur);
        
        if (ss_err > ss_err_all)
            t_ss = t_ss + 1;
        
        elseif (w_cur < w_target)
            V_l = V_max;
            w_err = (w_cur - w_target) / w_target;
            w_err = abs(w_err);
    
        else
            V_u = V_max;
            w_err = (w_cur - w_target) / w_target;
            w_err = abs(w_err);
    
        end
    end
end
