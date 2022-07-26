%SYDE 351 Final Project
%Group 27
%Smooth
%Voltage Smoothing

%Implements Average Value Smoothing Function

function l_out = Smooth(l_in, N)

    offset = ((N - 1)/2);
    l_out = l_in;

    for i = (1 + offset):(size(l_in, 2) - offset)

        sum = 0;

        for j = -offset:offset

            sum = sum + l_in(i + j);

        end

        l_out(i) = sum / N;

    end

end