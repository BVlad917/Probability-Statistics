clc
clear all

% d)
% Generate X~Nbin(n,p)  <=>  X ~ (0     1     2   3  ....  k  )
%                                (P(0) P(1) P(2) P(3) ... P(k))
%  Pascal (NBin) r.v. = sum of n Geometric r.v. 
%  to compare use:   0:k    nbin(0:k,n,p)   k also positive integer


p = 0.3;    % 0.3 probability of success

n = 5;
v = [];

for i = 1 : n
    u = rand;
    x = (u < p);
    c = 0;
    while x ~= 1
       u = rand;
       x = (u < p);
       c = c + 1;
    end
    x = c;
    v = [v, x];
end

Pascal = sum(v);




% Checking

N = 1000;
V = [];

for j = 1 : N
    v = [];

    for i = 1 : n
        u = rand;
        x = (u < p);
        c = 0;
        while x ~= 1
           u = rand;
           x = (u < p);
           c = c + 1;
        end
        X = c;
        v = [v, X];
    end
    Pascal = sum(v);
    V = [V, Pascal];
end

k = 30;
Frq_a = hist(V, 0 : k);
Frq_r = Frq_a / N;

bar(0 : k, Frq_r, 'b')
hold on
bar(0 : k, nbinpdf(0 : k, n, p), 'y')







