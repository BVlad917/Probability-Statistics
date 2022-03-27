clc
clear all

%        Problem 1

alpha = input('alpha = ');
beta = input('beta = ');
option = input('Choose option: normal, student, Chi2, Fischer: ','s');
switch option
  case 'normal'
    %  X~Norm(mu,sigma)    normal distribution
    disp('Normal distribution')
    mu=input('mu = ');
    sigma=input('sigma = ');
    Pa1 = normcdf( 0 ,mu,sigma);   % P(X <= 0)
    Pa2 = 1 - Pa1;      % P(X >= 0)
    Pb1 = normcdf(1, mu, sigma) - normcdf(-1, mu, sigma);    % P(-1 <= X <= 1)
    Pb2 = 1 - Pb1;      % P(X <= -1 or X >= 1)
    Pc = norminv(alpha,mu,sigma);  %P(X<=x)=alpha =>  x=?  
                  %P(X<=x)=normcdf(x)=alpha  => x=normcdf^(-1)(alpha)  
                  %                               normcdf^{-1)=norminv
                  % x_alpha s.t., P(X < x_alpha) = alpha
    Pd = norminv(1 - beta, mu , sigma);     % x_beta s.t., P(X > x_beta)  
                                            % not sure!

  case 'student'
    %  X~T(n)    student distribution
    disp('Student distribution');
    n=input('n=');
    Pa1 = tcdf( 0 ,n);      % P(X <= 0)
    Pa2 = 1 - Pa1;      % P(X >= 0)
    Pb1 = tcdf(1, n) - tcdf(-1, n);     % P(-1 <= X <= 1)
    Pb2 = 1 - Pb1;          % P(X <= -1 or X >= 1)
    Pc = tinv( alpha ,n);       % x_alpha s.t., P(X < x_alpha) = alpha
    Pd = tinv(1 - beta, n);     % x_beta s.t., P(X > x_beta) 

  case 'Chi2'
    %  X~Chi2(k)    Chi2 distribution
    disp('Chi2 distribution')
    k = input('k = ');
    Pa1 = chi2cdf(0, k);     % P(X <= 0)
    Pa2 = 1 - Pa1;      % P(X >= 0)
    Pb1 = chi2cdf(1, k) - chi2cdf(-1, k);       % P(-1 <= X <= 1)
    Pb2 = 1 - Pb1;      % P(X <= -1 or X >= 1)
    Pc = chi2inv(alpha, k);     % x_alpha s.t., P(X < x_alpha) = alpha
    Pd = chi2inv(1 - beta, k);      % x_beta s.t., P(X > x_beta) 
    % chi2cdf(???,???);    chi2inv(alpha,??);
  
  case 'Fischer'
    %  X~F(m,n)    Fisher distribution
    disp('Fisher distribution')
    m = input('m = ');
    n = input('n = ');
    Pa1 = fcdf(0, m, n);        % P(X <= 0)
    Pa2 = 1 - Pa1;          % P(X >= 0)
    Pb1 = fcdf(1, m, n) - fcdf(-1, m, n);       % P(-1 <= X <= 1)
    Pb2 = 1 - Pb1;      % P(X <= -1 or X >= 1)
    Pc = fcdf(alpha, m, n);     % x_alpha s.t., P(X < x_alpha) = alpha
    Pd = fcdf(1 - beta, m, n);      % x_beta s.t., P(X > x_beta) 
    % fcdf(???,m,n);    finv(?,?,?);

  otherwise
    fprintf('Wrong option!')
end

% Displaying the results.
fprintf('P(X<=0)= %1.5f \n', Pa1)
fprintf('P(X>=0)= %1.5f \n', Pa2)
fprintf('P(-1<=X<=1)= %1.5f \n', Pb1)
fprintf('P(X<=-1  or X>=1)= %1.5f \n', Pb2)
fprintf('x_alpha = %1.5f \n', Pd)
fprintf('x_beta = %1.5f \n', Pd)



%        Problem 2

p = 0.45;    %0.05 <= p <= 0.95
for n = 1 : 3 : 100 % or n = 1:2:100, or n = 1:5:100
    Bino_pdf = binopdf(0 : n, n, p);
    plot(0 : n, Bino_pdf ,'b')
    
    hold on
    ylim([0 0.8]);
    
    m = n * p;
    s = sqrt(n * p * (1 - p));
    Norm_pdf = normpdf(0:0.1:n, m, s);
    plot( 0 : 0.1 : n , Norm_pdf ,'r--')
    hold off
    pause(0.5)
end
legend('Binomial', 'Normal')

% For Poisson pdf we have poisspdf(???,lambda)
% and p should be less then 0.05

p = 0.03;    %0.05 <= p <= 0.95
for n = 1 : 3 : 100 % or n = 1:2:100, or n = 1:5:100
    Bino_pdf = binopdf(0 : n, n, p);
    plot(0 : n, Bino_pdf ,'b')
    
    hold on
    ylim([0 0.8]);
    
    lambda = n * p;
    Poisson_pdf = poisspdf(0:n, lambda);
    plot( 0 : n , Poisson_pdf ,'r--')
    hold off
    pause(0.5)
end
legend('Binomial', 'Poisson')