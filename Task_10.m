Task_9;

t = Q(:, 1);
dt = diff(t);


v = Q(:, 5);
w = Q(:, 6);

a = diff(v) ./ dt;
j = diff(a);
j = j ./ dt(1:size(j, 1));

alpha = diff(w) ./ dt;
zeta = diff(alpha);
zeta = zeta ./ dt(1:size(zeta, 1));

plot(t(1:size(zeta, 1)), zeta);
