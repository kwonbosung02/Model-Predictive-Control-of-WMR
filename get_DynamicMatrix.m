function [A, B] = get_DynamicMatrix(num,idx,params,data)

simNum = num.simNum;
horNum = num.horNum;

A = eye(idx.n_states);

v = sqrt(data.dy(1,simNum+horNum-1)^2 + data.dx(1,simNum+horNum-1)^2);

%Value A
A(idx.x, idx.theta) = -v * sin(data.theta(1,simNum+horNum-1)) * params.dt;
A(idx.y, idx.theta) = v * cos(data.theta(1,simNum+horNum-1)) * params.dt;

%Value B
B = zeros(idx.n_states,idx.n_inputs);
B(idx.x, idx.v) = cos(data.theta(1,simNum+horNum-1)) * params.dt;
B(idx.y, idx.v) = sin(data.theta(1,simNum+horNum-1)) * params.dt;
B(idx.theta, idx.w) = params.dt ; 

end