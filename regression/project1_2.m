close all; clc; clear;

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

second_degree_X = [ones(size(x)) x power(x,2)];
tenth_degree_X = [ones(size(x)) x power(x,2) power(x,3) power(x,4) power(x,5) power(x,6) power(x,7) power(x,8) power(x,9) power(x,10)];

variance = 0;

all_Y_matrix = zeros(N,100);

for i = 1:100
    
    H = mu + 0.1*randn(N,1); % NOISE 
    Y = (X * theta) + H;
    least_squares =  inv((X.' * X))  * (X.' * Y(:));
    Y_new = X * least_squares;

    second_degree_least_squares =  inv((second_degree_X.' * second_degree_X))  * (second_degree_X.' * Y(:));
    second_degree_Y = second_degree_X * second_degree_least_squares;
    
    all_Y_matrix(:,i) =  second_degree_Y;

end

mean_vector = mean(all_Y_matrix,2);
variance_vector = var(all_Y_matrix,1,2);
disp(mean_vector);

figure();
plot(variance_vector,'-b');
xlabel('Yn');
ylabel('Variance');

figure();
plot(mean_vector,'-r');
xlabel('Yn');
ylabel('Mean');

figure();
plot(second_degree_Y,'-b');
hold on;
plot(Y,'-k');
xlabel('Xn');
ylabel('2nd degree Y');
hold off;
%disp(mean_vector);

mse = immse(Y , second_degree_Y);
fprintf(' The mean-squared error is:  %f\n', mse);

all_Y_matrix = zeros(N,100);

for i = 1:100
    
    H = mu + 0.1*randn(N,1); % NOISE 
    Y = (X * theta) + H;
    tenth_degree_least_squares =  inv((tenth_degree_X.' * tenth_degree_X))  * (tenth_degree_X.' * Y(:));
    tenth_degree_Y = tenth_degree_X * tenth_degree_least_squares;
    all_Y_matrix(:,i) =  tenth_degree_Y;

end

mean_vector = mean(all_Y_matrix,2);
variance_vector = var(all_Y_matrix,1,2);
disp(mean_vector);


figure();
plot(variance_vector,'-b');
xlabel('Yn');
ylabel('Variance');

figure();
plot(mean_vector,'-r');
xlabel('Yn');
ylabel('Mean');

figure();
plot(tenth_degree_Y,'-b');
hold on;
plot(Y,'-k');
xlabel('Xn');
ylabel('2nd degree Y');
hold off;

mse = immse(Y , tenth_degree_Y);
fprintf(' The mean-squared error is:  %f\n', mse);

