clc
clear all
fprintf('WELCOME TO EQUATIONS SYSTEMS SOLVER\n\n')
A=input('Type the terms of the equations matrix: ');  
B=input('Type the terms of the column vector: '); 
clc; fprintf('Type "1" to shows steps, otherwise click enter:\n');
option=input('');

fprintf('\nExpanded Matrix')
fprintf('\n---------------------------------\n')
M=[A B]; disp(M)
fprintf('---------------------------------\n')

for i=1:length(M(:,1)) 
    if M(i,i)~=1  
        M(i,:)= M(i,:)./M(i,i);  
        if (option == 1)
          disp(M); fprintf('\n')
        end
        
    end
    
    for n=1:length(M(:,1))
      if n~=i 
          M(n,:)=-M(n,i).*M(i,:)+M(n,:);
           if (option == 1)
            disp(M); fprintf('\n')
           end
      end
    end
end
fprintf('\nGauss Jordan Matrix')
fprintf('\n---------------------------------\n')
disp(M)
fprintf('---------------------------------\n')