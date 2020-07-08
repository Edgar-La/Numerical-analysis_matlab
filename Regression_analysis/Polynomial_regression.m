%Polynomial regression

%-----------------------------------------------------------------
%graphics_toolkit ("gnuplot")
clear all;
clf;
fclose('all');
clc;
hold on;

%Reading .txt file
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

%Extended matrix
%---------------------------------------------------------------
q = input('Type order regression: ');

for i=0 : q
  for j=0 : q
    A(j+1,i+1) = sum(X.^(j+i));
  end
  x(i+1) = sum((X.^i).*Y);
end
fprintf ('\nExtended matrix fractions: \n');
format rat
C = [A x']
format short
fprintf ('\nExtended matrix decimal es: \n');
C = [A x']
%Gauss Jordan to solve system
%----------------------------------------------------------------
for i = 1 : length(C)-1;
 t = C(i,i);
 C(i,:) = C(i,:)/t;
 for k = i+1 : length(C)-1
  f = C(k,i);
  C(k,:) = C(k,:) - (f*C(i,:));
 end
end
for i = length(C)-1 : -1 : 1
  for k = i-1 : -1 : 1
    C(k,:) = C(k,:) - C(k,i)*C(i,:); 
  end
end
fprintf ('Gauss-Jordan matrix: \n');
format rat
C
format short
%Calculate regression
%-------------------------------------------------------------
f=0;
for i=0 : q
  f = f + (C(i+1,q+2)).*(X.^i);
end

%Show the regresion
%------------------------------------------------------------------
fprintf('\nEl ajuste es: \n');
fprintf('y = ')
for i=q: -1 : 0
  if i-1 >= 0
    if C(i+1,q+2) ~= 0
      if i > 1
        fprintf('(%s)x^%d + ',num2str(C(i+1,q+2)),i);
      elseif i==1
        fprintf('(%s)x + ',num2str(C(i+1,q+2)));
      else
        fprintf('(%s) + ',num2str(C(i+1,q+2)));
      end
    elseif C(i+1,q+2) == 1
      fprintf('x^%d + ',i);
    end
  else
    if C(i+1,q+2) ~= 0
      if i > 1
        fprintf('(%s)x^%d',num2str(C(i+1,q+2)),i);
      elseif i==1
        fprintf('(%s)x',num2str(C(i+1,q+2)));
      else
        fprintf('(%s)',num2str(C(i+1,q+2)));
      end
    elseif C(i+1,q+2) == 1
      fprintf('x^%d',i);
    end
  end  
end
fprintf('\n');

%Coefficient of determination tools
%---------------------------------------------------------------------
E=0;  S=0;
E = sum((Y-f).^2);
S = sum((Y-(sum(Y)/n)).^2);
r = sqrt((S-E)/S)
r2 = r^2

%Plot tools
%--------------------------------------------------------------------
plot(X,Y,'b*');
hold on;
plot(X,f,'r','linewidth',1.5);

%--------------------------------------------------------------------
%Labels in plot
title('Ajuste');    xlabel('eje X');    ylabel('eje Y');
text(1,(90*ceil(max(Y)))/100,['r = ',num2str(r)]);
text(1,(85*ceil(max(Y)))/100,['r^2 = ',num2str(r2)]);
