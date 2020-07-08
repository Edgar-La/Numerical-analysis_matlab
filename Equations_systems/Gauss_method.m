clc
clear all

fprintf('WELCOME TO GAUSS EQUATIONS SOLVER\n\n');
n=input('Type the number of unknows variables: ');
clc; m=n;

disp('Type equations matrix:')
for i=1:n
  for j=1:m
    disp(['Type component (',num2str(i),',',num2str(j),')'])
    A(i,j)=input ('');
  endfor
endfor

fprintf('\nType column vector:\n');
o=n;
for k=1:o
  disp(['The component (',num2str(k),')'])
  b(k)=input('');
endfor

fprintf('\nClick enter to calculate\n');input(''); clc

C=[A,b'];
for k=1:(n-1)
  for i=k+1:n
    u(i,k)=C(i,k)/C(k,k);
    for j=k:(n+1)
      C(i,j)=C(i,j)-u(i,k)*C(k,j);      
    endfor
  endfor
endfor

for i=n:-1:1
  suma=0;
  for p=(i+1):n
    suma= suma+C(i,p)*X(p);
  endfor
  X(i)=(C(i,n+1)-suma)/C(i,i);
endfor

fprintf('\nThe equations matrix:\n'); disp(A)
fprintf('\nThe column vector:\n'); disp(b')
fprintf('The results vector:\n'); disp(X')