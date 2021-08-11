function [idx,params] = get_params()

idx.x = 1;
idx.y = 2;
idx.theta = 3;
idx.v = 4;
idx.w = 5;

idx.n_states = 3;
idx.n_inputs = 2;
idx.n_hor = 13;

%Weight matrix
params.Qunit = diag([1,1,0.5]);
params.Runit = 0.1*eye(2);

%sampling time k
params.k = 0.01;

%start and and Time
params.Tinitial = 0;
params.Tfinal = 10;

%start and end State
params.startState = [0, -1, pi/2];
params.endState = [0, 0, 0];

end
