%Linear regression
%Edgar Lara
%-----------------------------------------------------------------
%graphics_toolkit ("gnuplot")
clear all;
clc;
clf;
hold on;
fclose('all');

%%Open (using file browser) and read .txt
%--------------------------------------------------------------

[archivo,ruta]=uigetfile('.txt','C:\Users\edfli\Documents\DCI\Tercer_Semestre\Metodos_Numericos\Segundo_Parcial\Ajustes');
fid =fopen([ruta archivo],'r');
AA=textscan(fid,'%f %f','headerlines',0);
AA=cell2mat(AA);
fclose(fid);
display(AA)
X=AA(:,1);
Y=AA(:,2);
size(X);
[numRows,numCols] = size(X);
n=numRows;
n;

%If you do not want to open file browser, you can directly load the file 
%{
load datos.txt
X = datos(:,1); Y = datos(:,2); n = length(X);
display([X Y]);
%}

%Variables to use
Sum_x = 0; Sum_x2 = 0; Sum_y = 0; Sum_xy = 0; Sum2_x = 0; Prom_Y = 0;

%Sums that method requires
Sum_x  = sum(X);
Sum_x2 = sum(X.^2);
Sum_y  = sum(Y);
Sum_xy = sum(X.*Y);
Sum2_x = (sum(X))^2;
Prom_y = mean(Y);

aux_den = n*Sum_x2 - Sum2_x;
alpha = (Sum_x2*Sum_y - Sum_x*Sum_xy) /aux_den;
beta  = (n*Sum_x2 - Sum_x*Sum_y) /aux_den;
Y_reg = alpha + beta*X; %Regression model
fprintf('Linear egression: %fx +  %f\n', beta, alpha);

%Determination coefficient
r2 = sum((Y_reg-Prom_y).^2)/sum((Y-Prom_y).^2);
r = sqrt(r2);
fprintf('r = %f\n',r); fprintf('r^2 = %f\n',r2);


%Plot
axis([min(X), max(X), min(Y), max(Y)]);
plot(X,Y,'*'); hold on;
plot(X,Y_reg,'r-');
xlabel('x'); ylabel('y');
title('Linear regression'); legend({'Values','Regression'});

%Determination coefficient labels in plot
text(5,(90*ceil(max(Y)))/100,['r = ',num2str(r)]);
text(5,(85*ceil(max(Y)))/100,['r^2 = ',num2str(r2)]);
