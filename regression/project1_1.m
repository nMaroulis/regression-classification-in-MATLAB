close all;
clc;
clear;
% VARIABLES %
N = 20;
xmin = 0;
xmax = 2;
sigma = sqrt(0.1);
mu = 0;
theta = [0.2; -1; 0.9; 0.7; 0 ; -0.2];
x = linspace(xmin,xmax,N).';
% --------- %

X = [ones(size(x)) x power(x,2) power(x,3) power(x,4) power(x,5)];
H = mu + 0.1*randn(N,1); % NOISE 
Y = (X * theta) + H;
Y_clean = (X * theta);

least_squares_theta =  inv((X.' * X))  * (X.' * Y(:));
Y_new = X * least_squares_theta;

plot(Y,'-k');
hold on;
plot(Y_clean , '-b');
hold on;
plot(Y_new , '-r');
xlabel('Xn');
ylabel('Yn');
lgd = legend('Y with noise','Y without noise','LS Y');
lgd.Location = 'northwest';
hold off;
mean_square_error = immse(Y , Y_new);

% 1000 Data points%
test_n = 1000;
test_x = xmin + rand(1,test_n)*(xmax - xmin); test_x = test_x.'; test_x = sortrows(test_x);
test_X = [ones(size(test_x)) test_x power(test_x,2) power(test_x,3) power(test_x,4) power(test_x,5)];
% H1 = mu + 0.1*randn(n,1); Y1 = (X1 * theta) + H1;

test_Y = (test_X * theta);

test_prediction_Y  = test_X * least_squares_theta;
test_mean_square_error = immse(test_Y , test_prediction_Y);

fprintf(' The mean-squared error for our test set with N=1000 is:  %f\n', test_mean_square_error);

plot(test_Y,'-k');
hold on;
plot(test_prediction_Y , '-b');
hold on;
xlabel('Xn');
ylabel('Yn');
lgd = legend('test Y','test predicted Y');
lgd.Location = 'northwest';
hold off;



