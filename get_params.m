function [idx,params] = get_params()

idx.x = 1;
idx.y = 2;
idx.theta = 3;
idx.v = 1;
idx.w = 2;

idx.n_states = 3;
idx.n_inputs = 2;
idx.n_hor = 13;
idx.n_dim = 3;

%iteration number
params.iterNum = 1000;

%Weight matrix
params.Qunit = diag([1,1,0.5]);
params.Runit = 0.1*eye(2);

%sampling period dt
params.dt = 0.025;

%start and end Time
params.Tinitial = 0;
params.Tfinal = 10;

%start and end State
params.startState = [0, -1, pi/2];
params.endState = [0, 0, 0];

%constraint
params.v_min = -0.4;
params.v_max = 0.4;
params.w_min = -0.4;
params.w_max = 0.4;

end
