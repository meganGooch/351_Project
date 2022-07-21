Task_8;

T_rms_r = rms(T(:, 2));
T_rms_l = rms(T(:, 3));

T_req = max(T_rms_r, T_rms_l);



% Parameter_Setup;
% 
% initial_velocity = 0;
% initial_angle = pi;
% final_time = t_in(end);
% 
% v_sim = [t_in, v_in];
% w_sim = [t_in, w_in];
% 
% %open('Task_1.slx');
% out = sim('Task_1.slx');
% 
% V = out.V;
% 
% t_out = V.time;
% Vr = V.Data(:, 1);
% Vl = V.Data(:, 2);
% 
% %N element Moving Average Filter
% 
% N = 3;
% Vr_smooth = Vr;
% Vl_smooth = Vl;
% 
% for i = (1 + ((N-1)/2)) : (size(Vr) - ((N-1)/2))
% 
%     sum_r = 0;
%     sum_l = 0;
% 
%     for j = -((N-1)/2):((N-1)/2)
% 
%         sum_r = sum_r + Vr(i + j);
%         sum_l = sum_l + Vl(i + j);
% 
%     end
% 
%     sum_r = sum_r / N;
%     sum_l = sum_l / N;
% 
%     Vr_smooth(i) = sum_r;
%     Vl_smooth(i) = sum_l;
% 
% end
% 
% voltage_check = [Vr Vr_smooth];
% 
% Vr_check = [t_out Vr];
% Vl_check = [t_out Vl];
% 
% check = sim("Task_1F");
% 
% Q = check.Q;
% t_check = Q.time;
% x_check = Q.Data(:,1);
% y_check = Q.Data(:,2);
% theta_check = Q.Data(:,3);
% 
% plot(x_check, y_check);
% 
% 
% 
% %plot3(x_check, y_check, t_check);
% 
% %xlabel("x");
% %ylabel("y");
% %zlabel("t");