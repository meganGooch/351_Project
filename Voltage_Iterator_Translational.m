%SYDE 351 Final Project
%Group 27
%Voltage Iterator
%Determining Voltage Signal

%This file determines the voltage signal for the translational sections of
    %the path

function [t, Vr, Vl, t_out] = Voltage_Iterator_Translational(V_max, v_max, d_target, t_profile)

    %finds guess for travel time
    t_final = abs(d_target/v_max);
    t_profile(4) = t_final;

    %creates trapezoidal profile using given parameters
    [t_in, V_in] = Voltage_Profile(t_profile, V_max);
    
    %smooths voltage signals
    V_in = Smooth(V_in, 25);
    V_in = Smooth(V_in, 15);

    %transposes matrices for simulation
    t_in = t_in';
    V_in = V_in';

    %simulates robots
    if (d_target > 0)
        outputs = Simulate_Robot(t_in, V_in, V_in, 0, 0);

    else
        outputs = Simulate_Robot(t_in, -V_in, -V_in, 0, 0);

    end
    
    d_guess = outputs(end, 2);

    %adjusts skew time
    if (d_target > 0)
        t_final = t_final + (d_target - d_guess) / v_max;

    else
        t_final = t_final - (d_target - d_guess) / v_max;

    end
    
    t_profile(4) = t_final;

    %creates trapezoidal profile using given parameters
    [t_in, V_in] = Voltage_Profile(t_profile, V_max);
    
    %smooths voltage signals
    V_in = Smooth(V_in, 25);
    V_in = Smooth(V_in, 15);

    t = t_in';
    if (d_target > 0)
        Vr = V_in';

    else
        Vr = -V_in';
        
    end
        
    Vl = Vr;
    t_out = t_profile;
end
