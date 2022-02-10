function [ n ] = gssn( a,b,FR )
%this function returns the number of iterations for the Golden Section
%Search 
rho = 0.382;
n = 1;
while true
    tmp = (1-rho)^n;
    if tmp >= (FR/(norm(b-a)))
        n = n+1;
    else
        break;
    end
end
end

