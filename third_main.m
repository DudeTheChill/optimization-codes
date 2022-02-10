syms x1 x2;


rosen = 100*(x2 - x1^2)^2 + (1-x1)^2;

himmelblau = (x1^2 + x2 - 11)^2 + (x1 + x2^2 - 7)^2;

f6 = exp(x1-1) + exp(1-x2) + (x1 - x2)^2;



[x14 y14 z14] = GD(rosen,[1 2],0.0001,0.001);


[x24 y24 z24] = SD(rosen,[1 2],0.001);


[x34 y34 z34] = GD(himmelblau,[1 2],0.0001,0.001);


[x44 y44 z44] = SD(himmelblau,[1 2],0.001);


[x15 y15 z15] = LM(himmelblau,[1 2],1000,0.001);


%[x16 y16 z16] = QNBGFS(f6, [0 0], [1 0;0 1], 30);


clc;
disp('question 4:');
disp('rosenbrock GD:');

disp('x_min:');
disp(x14);
disp('f_min:');
disp(y14);
disp('the result is given after:');
disp(z14);

disp('rosenbrock SD:');

disp('x_min:');
disp(x24);
disp('f_min:');
disp(y24);
disp('the result is given after:');
disp(z24);


disp('Himmelblau GD:');

disp('x_min:');
disp(x34);
disp('f_min:');
disp(y34);
disp('the result is given after:');
disp(z34);

disp('Himmelblau SD:');

disp('x_min:');
disp(x44);
disp('f_min:');
disp(y44);
disp('the result is given after:');
disp(z44);

disp('question 5:');
disp('Himmelblau :');

disp('x_min:');
disp(x15);
disp('f_min:');
disp(y15);
disp('the result is given after:');
disp(z15);


disp('question 6');
disp('x_min:');
disp(x16);
disp('f_min:');
disp(y16);
disp('the result is given after:');
disp(z16);
