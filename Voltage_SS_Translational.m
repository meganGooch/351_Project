%SYDE 351 Final Project
%Group 27
%Voltage SS
%Determining SS Voltage Speed

%This file determines the voltage value for the desired translational max
    %speed

function V_max = Voltage_SS_Translational(v_target)

    %defines max error
    v_err_all = 0.01;
    ss_err_all = 0.01;
    iterations_max = 100;
    
    %creates sim and step time
    t_ss = 1;
    t_step = 1;
    
    %defines initial voltages
    V_l = 0;
    V_u = 1;
    
    condition = 0;
    iterations = 0;
    
    %finds upper and lower bounds for the voltage
    while ((condition == 0) && (iterations < iterations_max))
    
        iterations = iterations + 1;
    
        t_in = linspace(0, t_ss, 1 + (t_ss/t_step));
    
        V_in = zeros(1, size(t_in, 2));
        V_in = V_in + V_u;
        
        t_in = t_in';
        V_in = V_in';
        
        outputs = Simulate_Robot(t_in, V_in, V_in, 0, 0);
        v_cur = outputs(end, 5);
        v_prev = outputs(end - 1, 5);
    
        if (((v_cur - v_prev) / v_cur) > ss_err_all)
            t_ss = t_ss + 1;

        elseif (outputs(end, 5) < v_target)
            V_u = V_u * 2;
    
        else
            condition = 1;
    
        end
    end
    
    iterations = 0;
    v_err = 1;
    
    %uses bisection method to determine required voltage
    while ((v_err > v_err_all) && (iterations < iterations_max))
    
        iterations = iterations + 1;
    
        V_max = 0.5 * (V_l + V_u);
    
        t_in = linspace(0, t_ss, 1 + (t_ss/t_step));
    
        V_in = zeros(1, size(t_in, 2));
        V_in = V_in + V_max;
        
        t_in = t_in';
        V_in = V_in';
        
        outputs = Simulate_Robot(t_in, V_in, V_in, 0, 0);
        v_cur = outputs(end, 5);
        v_prev = outputs(end - 1, 5);
    
        ss_err = abs((v_cur - v_prev) / v_cur);
        
        if (ss_err > ss_err_all)
            t_ss = t_ss + 1;
        
        elseif (v_cur < v_target)
            V_l = V_max;
            v_err = (v_cur - v_target) / v_target;
            v_err = abs(v_err);
    
        else
            V_u = V_max;
            v_err = (v_cur - v_target) / v_target;
            v_err = abs(v_err);
    
        end
    end
end
