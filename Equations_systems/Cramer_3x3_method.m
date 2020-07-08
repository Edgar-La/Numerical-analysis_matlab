clc
clear all
fprintf('WELCOME TO CRAMER 3X3 EQUATIONS SOLVER')
A=input('Type the euqations matrix as it follows [x x x; x x x; x x x]: ');
b=input('Type the column vector as it follows [x; x; x]: ');
clc

A1=A;   A1(:,1)=b;
A2=A;   A2(:,2)=b;
A3=A;   A3(:,3)=b;

dA=(A(1,1)*(A(2,2)*A(3,3)-A(3,2)*A(2,3))-A(1,2)*(A(2,1)*A(3,3)-A(3,1)*A(2,3))+A(1,3)*(A(2,1)*A(3,2)-A(3,1)*A(2,2)));
dA1=(A1(1,1)*(A1(2,2)*A1(3,3)-A1(3,2)*A1(2,3))-A1(1,2)*(A1(2,1)*A1(3,3)-A1(3,1)*A1(2,3))+A1(1,3)*(A1(2,1)*A1(3,2)-A1(3,1)*A1(2,2)));
dA2=(A2(1,1)*(A2(2,2)*A2(3,3)-A2(3,2)*A2(2,3))-A2(1,2)*(A2(2,1)*A2(3,3)-A2(3,1)*A2(2,3))+A2(1,3)*(A2(2,1)*A2(3,2)-A2(3,1)*A2(2,2)));
dA3=(A3(1,1)*(A3(2,2)*A3(3,3)-A3(3,2)*A3(2,3))-A3(1,2)*(A3(2,1)*A3(3,3)-A3(3,1)*A3(2,3))+A3(1,3)*(A3(2,1)*A3(3,2)-A3(3,1)*A3(2,2)));
x=dA1/dA; y=dA2/dA; z=dA3/dA;

fprintf('Equations Matrix\n'); disp(A); fprintf('\n')
fprintf('Column vector\n'); disp(b); fprintf('\n')
Results =[x; y; z]