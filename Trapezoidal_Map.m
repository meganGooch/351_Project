function [t_in, out] = Trapezoidal_Map(t_step, t_a, v_max, d)

    t_t = (d ./ v_max) + t_a;
    t_in = linspace(0, t_t, (t_t/t_step) + 1);

    a = v_max / t_a;

    out = zeros(1, size(t_in, 2));

    for i = 1:size(t_in, 2)

        if ((0 <= t_in(i)) && (t_in(i) <= t_a))
            out(i) = a * t_in(i);
        
        elseif ((t_t - t_a <= t_in(i)) && (t_in(i) < t_t))
            out(i) = v_max - a * (t_a - t_t + t_in(i));
        
        elseif ((t_a < t_in(i)) && (t_in(i) < (t_t - t_a)))
            out(i) = v_max;

        else
            out(i) = 0;
        
        end
    end


end
