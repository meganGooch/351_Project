%SYDE 351 Final Project
%Group 27
%Voltage Iterator
%Determining Voltage Signal

%This file determines the voltage signal for the rotational sections of
    %the path

function [t, Vr, Vl, t_out] = Voltage_Iterator_Rotational(V_max, w_max, theta_target, t_profile)

    %finds guess for travel time
    t_final = abs(theta_target/w_max);
    t_profile(4) = t_final;

    %creates trapezoidal profile using given parameters
    [t_in, V_in] = Voltage_Profile(t_profile, V_max);
    
    %smooths voltage signals
    V_in = Smooth(V_in, 21);

    %transposes matrices for simulation
    t_in = t_in';
    V_in = V_in';

    %simulates robots
    if (theta_target > 0)
        outputs = Simulate_Robot(t_in, V_in, -V_in, 0, 0);

    else
        outputs = Simulate_Robot(t_in, -V_in, V_in, 0, 0);

    end
    
    theta_guess = outputs(end, 4);

    %adjusts skew time
    if (theta_target > 0)
        t_final = t_final + (theta_target - theta_guess) / w_max;

    else
        t_final = t_final - (theta_target - theta_guess) / w_max;

    end
    
    t_profile(4) = t_final;
    
    %creates trapezoidal profile using given parameters
    [t_in, V_in] = Voltage_Profile(t_profile, V_max);
    
    V_in = Smooth(V_in, 21);
    
    t = t_in';

    if (theta_target > 0)
        Vr = V_in';

    else
        Vr = -V_in';
        
    end
        
    Vl = -Vr;
    t_out = t_profile;
end
