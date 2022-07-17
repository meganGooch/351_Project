Task_8;

v_sim = [t_in, v_in];
w_sim = [t_in, w_in];

%open('Task_1.slx');
out = sim('Task_1.slx');

V = out.V;

t_out = V.time;
Vr = V.Data(:, 1);
Vl = V.Data(:, 2);

Vr_check = [t_out Vr];
Vl_check = [t_out Vl];

check = sim("Task_1F");

Q = check.Q;
t_check = Q.time;
x_check = Q.Data(:,1);
y_check = Q.Data(:,2);
theta_check = Q.Data(:,3);


plot3(x_check, y_check, t_check);

xlabel("x");
ylabel("y");
zlabel("t");