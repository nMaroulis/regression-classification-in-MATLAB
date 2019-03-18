close all;clc;clear;
% VARIABLES %
N = 1000;
xmin = 0;
xmax = 2;
sigma = sqrt(0.1);
mu = 0;
theta = [0.2; -1; 0.9; 0.7; 0 ; -0.2];
x = linspace(xmin,xmax,N).';
I = diag(ones(6,1));% diagonal_matrix
X = [ones(size(x)) x power(x,2) power(x,3) power(x,4) power(x,5)];
H = mu + 0.1*randn(N,1); % NOISE 
lamda = 0.4
% --------- %

Y = (X * theta) + H;
Y_clean = X * theta;

% ridge regression
b =  ( (X.' * X)  + ( lamda * I) ) \ (X.' * Y(:));

Y_new  = X*b;

mean_square_error = immse(Y , Y_new);

fprintf('The mean-squared error for N=20 is: %f \n', mean_square_error);

% 1000 Data points%
n = 1000;
I1 = diag(ones(6,1)); % diagonal_matrix

x1 = xmin + rand(1,n)*(xmax - xmin); x1 = x1.'; x1 = sortrows(x1);
X1 = [ones(size(x1)) x1 power(x1,2) power(x1,3) power(x1,4) power(x1,5)];
H1 = mu + 0.1*randn(n,1);
Y1 = (X1 * theta) + H1;

lamda = 0;
b1 =  ( (X1.' * X1)  + ( lamda * I1) ) \ (X1.' * Y1(:));
Y1_new  = X1*b1;
mean_square_error1 = immse(Y1 , Y1_new);
fprintf('The mean-squared error for N=1000 is: %f and lamda %f\n', mean_square_error1, lamda);



lamda = 0.01;
b1 =  ( (X1.' * X1)  + ( lamda * I1) ) \ (X1.' * Y1(:));
Y1_new  = X1*b1;
mean_square_error01 = immse(Y1 , Y1_new);
fprintf('The mean-squared error for N=1000 is: %f and lamda %f\n', mean_square_error1, lamda);


lamda = 0.05;
b1 =  ( (X1.' * X1)  + ( lamda * I1) ) \ (X1.' * Y1(:));
Y1_new  = X1*b1;
mean_square_error05 = immse(Y1 , Y1_new);
fprintf('The mean-squared error for N=1000 is: %f and lamda %f\n', mean_square_error1, lamda);




lamda = 0.1;
b1 =  ( (X1.' * X1)  + ( lamda * I1) ) \ (X1.' * Y1(:));
Y1_new  = X1*b1;
mean_square_error2 = immse(Y1 , Y1_new);
fprintf('The mean-squared error for N=1000 is: %f and lamda %f\n', mean_square_error1, lamda);



lamda = 0.2;
b1 =  ( (X1.' * X1)  + ( lamda * I1) ) \ (X1.' * Y1(:));
Y1_new  = X1*b1;
mean_square_error3 = immse(Y1 , Y1_new);
fprintf('The mean-squared error for N=1000 is: %f and lamda %f\n', mean_square_error1, lamda);

lamda = 0.3;
b1 =  ( (X1.' * X1)  + ( lamda * I1) ) \ (X1.' * Y1(:));
Y1_new  = X1*b1;
mean_square_error4 = immse(Y1 , Y1_new);
fprintf('The mean-squared error for N=1000 is: %f and lamda %f\n', mean_square_error1, lamda);

lamda = 0.4;
b1 =  ( (X1.' * X1)  + ( lamda * I1) ) \ (X1.' * Y1(:));
Y1_new  = X1*b1;
mean_square_error5 = immse(Y1 , Y1_new);
fprintf('The mean-squared error for N=1000 is: %f and lamda %f\n', mean_square_error1, lamda);


lamda = 0.5;
b1 =  ( (X1.' * X1)  + ( lamda * I1) ) \ (X1.' * Y1(:));
Y1_new  = X1*b1;
mean_square_error6 = immse(Y1 , Y1_new);
fprintf('The mean-squared error for N=1000 is: %f and lamda %f\n', mean_square_error1, lamda);

lamda = 0.6;
b1 =  ( (X1.' * X1)  + ( lamda * I1) ) \ (X1.' * Y1(:));
Y1_new  = X1*b1;
mean_square_error7 = immse(Y1 , Y1_new);
fprintf('The mean-squared error for N=1000 is: %f and lamda %f\n', mean_square_error1, lamda);

lamda = 0.7;
b1 =  ( (X1.' * X1)  + ( lamda * I1) ) \ (X1.' * Y1(:));
Y1_new  = X1*b1;
mean_square_error8 = immse(Y1 , Y1_new);
fprintf('The mean-squared error for N=1000 is: %f and lamda %f\n', mean_square_error1, lamda);


mse = [mean_square_error1, mean_square_error01, mean_square_error05, mean_square_error2, mean_square_error3, mean_square_error4, mean_square_error5, mean_square_error6, mean_square_error7, mean_square_error8].';
l = [0, 0.01, 0.05 , 0.1 , 0.2 , 0.3 , 0.4 , 0.5 , 0.6 , 0.7].';

%plot(Y1,'-k');
%hold on;
%plot(Y1_new , '-b');
%hold on;
%xlabel('Xn');
%ylabel('Yn');
%lgd = legend('Y1 with noise','LS Y1');
%lgd.Location = 'northwest';
%hold off;
plot(l, mse , '-b');
hold on;
xlabel('Lamda');
ylabel('MSE');
lgd = legend('Lamda','MSE');
lgd.Location = 'northwest';
hold off;