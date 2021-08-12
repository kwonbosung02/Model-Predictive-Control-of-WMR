function [A, B] = get_DynamicMatrix(num,idx,params)

simNum = num.simNum;
horNum = num.horNum;

A = eye(idx.n_states);
A(idx.x, idx.theta) = -data.y(1,simNum+horNum-1) * sin(data.theta(1,simNum+horNum-1)) * params.dt;
A(idx.y, idx.theta) = data.y(1,simNum+horNum-1) * cos(data.theta(1,simNum+horNum-1)) * params.dt;

B = zeros(idx.n_states,idx.n_inputs);
B(idx.x, idx.v) = cos(data.theta(1,simNum+horNum-1)) * params.dt;
B(idx.y, idx.v) = sin(data.theta(1,simNum+horNum-1)) * params.dt;
B(idx.theta, idx.w) = params.dt ; 

end