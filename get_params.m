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

%Condensed Weight matrix
params.Qcond = cell(idx.n_hor);
params.Rcond = cell(idx.n_hor);
for i = 1 : idx.n_hor
   for j = 1 : idx.n_hor
       if i == j
           params.Qcond{i,j} = params.Qunit;
           params.Rcond{i,j} = params.Runit;
       end
       if i ~= j
           params.Qcond{i,j} = [0 0 0; 0 0 0; 0 0 0];
           params.Rcond{i,j} = [0 0; 0 0];
       end
   end
end
params.Qcond = cell2mat(params.Qcond);
params.Rcond = cell2mat(params.Rcond);
%sampling period dt
params.dt = 0.025;

%start and end State
params.startState = [0; -1; pi/2];
params.endState = [0; 0; 0];

%constraint
params.v_min = -0.4;
params.v_max = 0.4;
params.w_min = -0.4;
params.w_max = 0.4;

%constraint Matrix
%quadProg A 
params.quadProgA = cell(idx.n_hor)
Acont = vertcat(eye(2),-eye(2));

for i = 1 : idx.n_hor
    for j = 1 : idx.n_hor
        if(i == j)
        params.quadProgA{i,j} = Acont;
        end
        
        if(i ~= j)
        params.quadProgA{i,j} = [0 0; 0 0; 0 0; 0 0];
        end
    end
end
params.quadProgA = cell2mat(params.quadProgA);

%quadProg b
params.quadProgb = cell(idx.n_hor,1);
for i = 1 : idx.n_hor

    params.quadProgb{i,1} = [params.v_max; params.w_max; -params.v_min; -params.w_min];
end
params.quadProgb = cell2mat(params.quadProgb);

end
