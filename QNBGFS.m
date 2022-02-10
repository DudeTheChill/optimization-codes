function [ x_min f_min iteration ] = QNBGFS(f_arg, x00, H0, iter)
%Quasi-Newton,BGFS modification.

%x00 is the initial point
%H0 is initial H for approximation of F(x).
%iter is the number of iterations that we want our code to run for.


%initializing counter
iteration = 1;



temp = symvar(f_arg);
n = size(temp,2);
X = sym('x', [1 n]);
syms a;


f_arg = subs(f_arg,temp,X);

%gvf is fradient vector of f(x).
gvf= gradient(f_arg,X);



while iteration <= iter
    
      % computing d for main newton's method equation.
      %xk+1 = xk - alpha*dk
      d = H0 * fun_eval(gvf,x00);
      
      
      %%%%This section is for calculating alphak %%%%%
      tmp = x00 - transpose(a * d);
      str2 = fun_eval_sym(f_arg,tmp); 

      alphie  = GSS(str2,0,10,0.0001);
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
      
      %Updating point
      x11 = x00 - transpose(alphie*d);

      
      %%%%%This section is for computing Hk+1 using BGFS method%%%%%%%%%
      dxT = x11 - x00; %delta x transpose
      dx = transpose(dxT);%delta x 

      dg = fun_eval(gvf,x11) - fun_eval(gvf,x00); %delta g
      dgT = transpose(dg); %delta g transpose

      H1 = H0 + (1+((dgT * H0 * dg)/(dgT * dx)))*((dx * dxT)/(dxT * dg)) - (((H0 * dg * dxT) + transpose(H0 * dg * dxT))/(dgT * dx));
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      
      
      
      H0 = H1;
      x00 = x11;
      
      iteration = iteration + 1;
      
      
end

x_min = x00;
f_min = fun_eval(f_arg,x_min);

end

 