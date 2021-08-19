function [A, B] = get_DynamicMatrix(num,idx,params,data,states)

simNum = num.simNum;
horNum = num.horNum;

A = eye(idx.n_states);
k_ = simNum + horNum - 1;
%Value A
A(idx.x, idx.theta) = -data.dy(1,k_) * params.dt;
A(idx.y, idx.theta) = data.dx(1,k_) * params.dt;
%Value B
B = zeros(idx.n_states,idx.n_inputs);
B(idx.x, idx.v) = cos(data.theta(1,k_)) * params.dt;
B(idx.y, idx.v) = sin(data.theta(1,k_)) * params.dt;
B(idx.theta, idx.w) = params.dt ; 

end