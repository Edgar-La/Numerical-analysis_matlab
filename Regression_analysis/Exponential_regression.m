%Exponential regression
%Edgar Lara
%-----------------------------------------------------------------
%graphics_toolkit ("gnuplot") %If you want to use gnuplot instead

clear all;
clc;
clf;
hold on;
fclose('all');

%Open (using file browser) and read .txt
%--------------------------------------------------------------
[archivo, ruta] = uigetfile('.txt', 'C:\Users\edfli\Desktop\NUM_MAT\Numerical-analysis_matlab\Regression_analysis')
fid = fopen([ruta archivo], 'r');
Matrix = textscan(fid, '%f %f', 'headerlines', 0);
Matrix = cell2mat(Matrix);
fclose(fid);
X = Matrix(:,1);    Y = Matrix(:,2);    display([X Y]);
n = length(X);

%If you do not want to open file browser, you can directly load the file 
%{
load datos3.txt X = datos3(:,1);    Y = datos3(:,2);
n = length(X); display([X Y]);
%}

%Variables to use
Sum_x=0; Sum_x2=0; Sum_2x=0; Sum_xlny=0; Sum_lny=0; Sum_y=0;

%Sums that method requires
Sum_x = sum(X);
Sum_x2 = sum(X.^2);
Sum_xlny = sum(X.*log(Y));
Sum_lny = sum(log(Y));
Sum_y = sum(Y);
Sum_2x = Sum_x^2;

alpha=(n*(Sum_xlny)-Sum_x*Sum_lny)/(n*Sum_x2-Sum_2x);
beta=exp((Sum_lny-(alpha*Sum_x))/n);
Y_reg=beta*exp(X*alpha);
fprintf('Regression: %f e^(x*%f)\n', beta, alpha);

%Determination coefficient
E = 0; S = 0; yp = Sum_y/n;
E = sum( (Y - beta*exp(alpha*X)).^2 );
S = sum((Y - yp).^2);
r=((S-E)/S)^(1/2);
r2=r^2;
fprintf('r = %f\n',r); fprintf('r^2 = %f\n',r2);


%Plot
axis([min(X), max(X), min(Y), max(Y)]);
plot(X,Y, 'b*'); hold on;
plot(X,Y_reg, 'r-');
xlabel('x'); ylabel('y');
title('Exponential regression'); legend({'Values','Regression'});

%Determination coefficient labels in plot
text(5,(90*ceil(max(Y)))/100,['r = ',num2str(r)]);
text(5,(85*ceil(max(Y)))/100,['r^2 = ',num2str(r2)]);


