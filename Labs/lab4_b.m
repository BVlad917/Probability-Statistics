clc
clear all
% b)
% Generate X~Bino(n,p)  <=>  X ~ (0     1     2   3  ....  n  )
%                                (P(0) P(1) P(2) P(3) ... P(n))
% Binomial r.v. = sum of n Bernoully r.v X (counts the number of ones)
% to compare use:    0:n          binopdf(0:n,n,p)

p = 0.3;    % 0.3 probability of success
n = 10;     % 10 trials
v = [];     % save result of each trial here

for i = 1 : n
   u = rand;
   X = (u < p);
   v = [v, X];
end
Bino = sum(v);






% Checking
N = 100;
V = [];
for j = 1 : N
    v = [];
    for i = 1 : n
        u = rand;
        X = (u < p);
        v = [v, X];
    end
Bino = sum(v);
V = [V, Bino];
end

Frq_a = hist(V, 0 : n);
Frq_r = Frq_a / N;
binopdf(0 : n, n, p);

bar(0 : n, Frq_r, 'b')
hold on
bar(0 : n, binopdf(0 : n, n, p), 'y')


