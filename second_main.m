clc;

syms x1 x2 x3 x4


f1 = 100*(x2 - x1^2)^2 + (1-x1)^2;

f2 = (x1+10*x2)^2 + 5*(x3-x4)^2 + (x2-2*x3)^4 + 10*(x1-x4)^4;
disp('Part b, results for Rosenbrock function:')
[x y z] = GSS(f1,[-5;-5],[5;5],0.00001);

disp('Golden Section Search on Rosenbrock funtion ended on iteration:');
disp(z);
disp('the minimizer is:');
disp(x);
disp('and the function value for the minimizer is:');
disp(y);


[x y z] = newtons_method(f1,[-5,-5],0.00001);

disp('Newtons Method Search on Rosenbrock funtion ended on iteration:');
disp(z);
disp('the minimizer is:');
disp(x);
disp('and the function value for the minimizer is:');
disp(y);


disp('Part c, results for Powel function:')
[x y z] = GSS(f2,[-4;-4;-4;-4],[5;5;5;5],0.00000000001);

disp('Golden Section Search on Powel funtion ended on iteration:');
disp(z);
disp('the minimizer is:');
disp(x);
disp('and the function value for the minimizer is:');
disp(y);



[x y z] = newtons_method(f2,[-5,-5,-5,-5],0.0000001);

disp('Newtons Method Search on Powel funtion ended on iteration:');
disp(z);
disp('the minimizer is:');
disp(x);
disp('and the function value for the minimizer is:');
disp(y);



