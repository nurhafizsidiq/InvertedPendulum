%% Muhammad Nurhafiz Sidiq
% 20/460179/TK/50768
% Control of Inverted pendulum on cart with partial feedback linearization

function dx=invpen(t,x)

%% set parameter
M = 1;
m = 0.1;
l = 1;
g = 9.8;
b = 0.05;

%control input
alpha = (M+(1-3/4*cos(x(3))^2)*m);

%% Partial Feedback linearization extended
k1 = 80;
k2 = 40;
k3 = 20;
k4 = 20;
xwanted = 5;
v = (-k1*(x(3)-pi) - k2*x(4))/cos(x(3)) + (-k3*(x(1)-xwanted) - k4*x(2));
U = b*x(2) - m*l/2*x(4)^2*sin(x(3)) - 3/4*m*g*sin(x(3))*cos(x(3)) - alpha*g*sin(x(3))/cos(x(3)) - 2*l/3*v*alpha;

%% state dynamic
dx=zeros(4,1);
dx(1) = x(2);
dx(2) = (((3/4)*g*m*sin(x(3))*cos(x(3)))+(m*1*(x(4))^2*sin(x(3))/2)+U-b*x(2))/(M+m-m*(3/4)*cos(x(3))^2);
dx(3) = x(4);
dx(4) = (3/(2*l))*(-dx(2)*cos(x(3))-g*sin(x(3)));
dx