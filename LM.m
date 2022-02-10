function [ x_min f_min iteration ] = LM(f_arg, x00, mu, eps)
%Newton's method, Levenberg - Marquadt modification.

%x00 is the initial point.
%mu is a large number(usualy 1000).
%eps is error bound.

%initializing counter
iteration = 0;



temp = symvar(f_arg);
n = size(temp,2);
X = sym('x', [1 n]);
syms a;


f_arg = subs(f_arg,temp,X);

%gvf is fradient vector of f(x).
gvf= gradient(f_arg,X);

hmf = hessian(f_arg,X);
I = eye(size(hmf));


while true
    
      % computing d for main newton's method equation.
      %xk+1 = xk - alpha*dk
      mu = mu/(10^iteration);
      d = I/(fun_eval(hmf,x00)+(mu*I)) * fun_eval(gvf,x00);
      
      
      %%%%This section is for calculating alphak %%%%%
      tmp = x00 - transpose(a * d);
      str2 = fun_eval_sym(f_arg,tmp); 

      alphie  = GSS(str2,0,10,0.0001);
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
      
      %Updating point
      x11 = x00 - transpose(alphie*d);

      
      
      p = norm(abs(x00-x11));
      if p < eps
         break;
      else 
         x00 = x11;
      end
      
      iteration = iteration + 1;
      
      
end

iteration = iteration + 1;
x_min = x00;
f_min = fun_eval(f_arg,x_min);

end

 