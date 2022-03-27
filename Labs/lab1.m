A = [1, 0, -2; 2, 1, 3; 0, 1, 0];
B = [2, 1, 1; 1, 0, -1; 1, 1, 0];

C = A - B;
D = A * B;
E = A .* B;

disp(C)
disp(D)
disp(E)

x = 0 : 0.001 : 3;

y1 = (x .^ 5) ./ 10;
y2 = x .* sin(x);
y3 = cos(x);

plot(x, y1, '-k', 'LineWidth', 2);
hold on;
plot(x, y2, '--b', 'LineWidth', 3);
hold on;
plot(x, y3, ':r', 'LineWidth', 4);
title("Functions");
legend('x^5/10', 'x*sin(x)', 'cos(x)');

% subplot(2, 2, 1);
% plot(x, y1);
% subplot(2, 2, 2);
% plot(x, y2);
% subplot(2, 2, 3);
% plot(x, y3);
