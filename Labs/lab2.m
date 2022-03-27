clc;

n=3;    % nr of trials
p=1/2;  % probability of success (in each trial)
x=0:n;  % interval

pdf = binopdf(x, n, p); % probability distribution
disp([x; pdf]);

F = binocdf(x, n, p);   % cumulative distribution
disp([x; F]);

subplot(2, 1, 1);
bar(x, pdf, 'b');
title("pdf");

subplot(2, 1, 2);
bar(x, F, 'b');
title("cdf");

P0 = binopdf(0, 3, p);   % P(X=0)
P1 = binopdf(1, 3, p);  % P(X=1)
Pnot1 = 1 - P1;    % P(X!=1)

CUpTo2 = binocdf(2, n, p);      % P(X<=2)
CUpTo1 = binocdf(1, n, p);      % P(X<2) = P(X<=1)
CBiggerThan1 = 1 - CUpTo1;  % P(X>1) = 1 - P(X<=1)
CBiggerEqualTo1 = 1 - P0;   % P(X>=1) = P(X>0) = 1 - P(X<=0) = 1 - P(X=0)

sum(binornd(1, 1/2, 1, 3))  % Simulating 3 coin tosses and finding the number of heads