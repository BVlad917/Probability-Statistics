clc
clear all

%  a) 

% Generate X~Bernoulli(p)    <=>    X ~ (0     1)
                                      % (1-p   p)
p = 0.3;
u = rand;

X = (u < p); 


%  Verify (compare to the exact probability)
N = 1000;
for i = 1 : N
  U = rand;
  Bernoulli(i) = (U < p); % generate a sample of N values
end
 
Frq_a = hist(Bernoulli, 0 : 1);  % count the number of appearence of each
Frq_r = Frq_a/N;   % compute the relative frequency
disp('Estimated Bernoulli distribution')
disp([0 : 1; Frq_r])
disp('Theoretical Bernoulli distribution')
disp([0 : 1; binopdf(0:1,1,p)])

bar(0:1 , Frq_r, 'b')
hold on
bar(0:1 , binopdf(0:1,1,p), 'y')
legend('Estimated','Theoretical')
set(findobj('type','patch'), 'facealpha',0.7)