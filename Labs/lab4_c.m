clc
clear all

% c) 
% Generate X~Geo(p)  <=>  X ~ (0     1     2   3  ....  k   ...  )
%                             (P(0) P(1) P(2) P(3) ... P(k) ...  )
% Geometric r.v.(counts the number of zeros before first one) 
% to compare use:    0:k     geopdf(0:k,p)   k positive integer


p = 0.3;    % 0.3 probability of success

u = rand;
X = (u < p);
c = 0;
while X ~= 1
   u = rand;
   X = (u < p);
   c = c + 1;
end

c;



% Checking

N = 100;
V = [];
for i = 1 : N
    u = rand;
    X = (u < p);
    c = 0;
    while X ~= 1
        u = rand;
        X = (u < p);
        c = c + 1;
    end
    x = c;
    V = [V, x];
end


k = 20;
Frq_a = hist(V, 0 : k);
Frq_r = Frq_a / N;
geopdf(0 : k, p);

bar(0 : k, Frq_r, 'b')
hold on
bar(0 : k, geopdf(0 : k, p), 'y')











