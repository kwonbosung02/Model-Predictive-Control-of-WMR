function data = get_Data()

t = 0 : 0.01 : 2*pi;
t2 = 2*pi-0.01 : -0.01 : 0;

%X Y Theta data
X = horzcat(2*sin(t),-2*sin(t2));
Y = horzcat(2*cos(t+pi)+2,-2*cos(t2+pi)-2);
theta = horzcat(t,t2);

dX = horzcat(2*cos(t),2*cos(t2));
dY = horzcat(-2*sin(t+pi),-2*sin(t2+pi));

% %================Test=================
% t = 0 : 0.01 : 2*pi;
% theta = t;
% X = cos(t);
% Y = sin(t)+1;
% dX = -sin(t);
% dY = cos(t);
% plot(X,Y);
% %=====================================
plot(X,Y)
grid on
data.x = X;
data.y = Y;

data.theta= theta;
data.states = [X; Y; theta];

data.dx = dX;
data.dy = dY;
data.v = sqrt(dX.^2+dY.^2);
data.w = gradient(theta);

end

