function data = getData()

t = 0 : 0.01 : 2*pi;
t2 = 2*pi-0.025 : -0.01 : 0;

%X Y Theta
X = horzcat(2*sin(t),-2*sin(t2));
Y = horzcat(2*cos(t+pi)+2,-2*cos(t2+pi)-2);
theta = horzcat(t,t2);

data.x = X;
data.y = Y;
data.theta= theta;

% plot(X,Y)
end

