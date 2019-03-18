close all;
clc;
clear;

% VARIABLES %
N = 20;
xmin = 0;
xmax = 2;
sigma_theta = 0.1;
sigma1 =0.05;
sigma2 =0.15;
mu = 0;
theta = [0.2; -1; 0.9; 0.7; 0 ; -0.2];

I = diag(ones(6,1));% diagonal_matrix
covariance_matrix = sigma_theta * I;

linearr = linspace(-1,0.9,6).';

x = xmin + rand(1,N)*(xmax - xmin); x = x.'; x = sortrows(x);
X = [ones(size(x)) x power(x,2) power(x,3) power(x,4) power(x,5)];

noise =  normpdf( 0,0, sigma1);

Y = X * theta;


prior = normpdf(theta, covariance_matrix);

theta_map = theta + (1/sigma1)* inv( (1/sigma_theta)*I +  (1/sigma1)*(X.' * X)) * X.'*(Y - X*theta);

%Y_new = X * theta_map;


plot(linearr, normpdf(linearr,mean(theta), std(theta)));
lgd = legend('Prior');
lgd.Location = 'northwest';
hold off;

fprintf('---- dddd \n');
