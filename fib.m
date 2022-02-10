function [ no ] = fib( n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% if n==1
%     no = 1;
% else if n==2
%         no =2;
% else
%     no = fib(n-1) + fib(n-2);  
%     end
% end
% The commented code above is the recursive approach for fibonacci sequence. 


% The code below is the Dynamic Programming aproach for fibonacci sequence.
fib = zeros(1,n+1);
fib(1,1) = 1;
fib(1,2) = 1;
if n >= 3
   for i = 3:n+1
	   fib(1,i)=fib(1,i-1) + fib(1,i-2);
   end
end
no =  fib(n);
end