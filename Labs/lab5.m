clc
clear all

% B.
% 1)
fprintf('1.\n')
Data = [7 7 4 5 9 9
        4 12 8 1 8 7
        3 13 2 1 17 7
        12 5 6 2 1 13
        14 10 2 4 9 11
        3 5 12 6 10 7];

% a) Confidence interval for the mean; std known
sigma = 5;
conf_level = 0.9;
alpha = 1 - conf_level;

m_s = mean(Data(:));
z = norminv(1 - alpha / 2, 0, 1);
n = length(Data(:));
m_L = m_s - sigma / sqrt(n) * z;
m_R = m_s + sigma / sqrt(n) * z;

fprintf('a) Std known: The CI for the mean is (%4.2f, %4.2f)\n', m_L, m_R)


% b) Confidence interval for the mean; std unknown
conf_level = 0.9;
alpha = 1 - conf_level;

m_s = mean(Data(:));
sigma_s = std(Data(:));

n = length(Data(:));
t = tinv(1 - alpha / 2, n - 1);
m_L = m_s - sigma_s / sqrt(n) * t;
m_R = m_s + sigma_s / sqrt(n) * t;

fprintf('b) Std unknown: The CI for the mean is (%4.2f, %4.2f)\n', m_L, m_R)


% c) Confidence intervals for the variance and for the standard deviation

conf_level = 0.9;
alpha = 1 - conf_level;

v = var(Data(:));
n = length(Data(:));

c_1 = chi2inv(1 - alpha / 2, n - 1);
c_2 = chi2inv(alpha / 2, n - 1);

m_L = (n - 1) * v / c_1;
m_R = (n - 1) * v / c_2;

fprintf('c) The CI for the variance is (%4.2f, %4.2f)\n', m_L, m_R)
fprintf('   The CI for the Std is (%4.2f, %4.2f)\n', sqrt(m_L), sqrt(m_R))



% 2)
fprintf('2.\n')
% a)

Premium = [22.4, 21.7, 24.5, 23.4, 21.6, 23.3, 22.4, 21.6, 24.8, 20.0];
Regular = [17.7, 14.8, 19.6, 19.6, 12.1, 14.8, 15.4, 12.6, 14.0, 12.2];

% a) sigma1 = sigma2, find confidence interval for the difference of the
% true means

conf_level = 0.9;
alpha = 1 - conf_level;

mean_premium = mean(Premium);   % sample mean
mean_regular = mean(Regular);   % sample mean

n_premium = length(Premium);
n_regular = length(Regular);

t = tinv(1 - alpha / 2, n_premium + n_regular - 2);

variance_premium = var(Premium);   % sample variance
variance_regular = var(Regular);   % sample variance

sp_squared = ((n_premium - 1) * variance_premium + (n_regular - 1) * variance_premium) / n_premium + n_regular - 2;
sp = sqrt(sp_squared);

m_L = mean_premium - mean_regular - t * sp * sqrt(1 / n_premium + 1 / n_regular);
m_R = mean_premium - mean_regular + t * sp * sqrt(1 / n_premium + 1 / n_regular);

fprintf('a) sigma1 = sigma2, both unknown: The CI for the difference of the true means is (%4.2f, %4.2f)\n', m_L, m_R)


% b) sigma1 != sigma2, find confidence interval for the difference of the
% true means

conf_level = 0.9;
alpha = 1 - conf_level;

mean_premium = mean(Premium);   % sample mean
mean_regular = mean(Regular);   % sample mean

variance_premium = var(Premium);   % sample variance
variance_regular = var(Regular);   % sample variance

n_premium = length(Premium);
n_regular = length(Regular);

t = tinv(1 - alpha / 2, n_premium + n_regular - 2);

c = (variance_premium / n_premium) / (variance_premium / n_premium + variance_regular / n_regular);
n_inv = c^2 / (n_premium - 1) + (1 - c)^2 / (n_regular - 1);
n = 1 / n_inv;

m_L = mean_premium - mean_regular - t * sqrt(variance_premium / n_premium + variance_regular / n_regular);
m_R = mean_premium - mean_regular + t * sqrt(variance_premium / n_premium + variance_regular / n_regular);

fprintf('b) sigma1 != sigma2, both unknown: The CI for the difference of the true means is (%4.2f, %4.2f)\n', m_L, m_R)


% c) CI for the ratio of the variances
conf_level = 0.9;
alpha = 1 - conf_level;

variance_premium = var(Premium);   % sample variance
variance_regular = var(Regular);   % sample variance

n_premium = length(Premium);
n_regular = length(Regular);

f_1 = finv(1 - alpha / 2, n_premium - 1, n_regular - 1);
f_2 = finv(alpha / 2, n_premium - 1, n_regular - 1);
m_L = 1 / f_1 * variance_premium / variance_regular;
m_R = 1 / f_2 * variance_premium / variance_regular;

fprintf('c) The CI for the ratio of the variances (%4.2f, %4.2f)\n', m_L, m_R)














