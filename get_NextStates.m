function xN = get_NextStates(states,idx, params, u)

xN = [0; 0; 0];
%x
xN(idx.x) = states(idx.x) + params.dt * u(idx.v) * cos(states(idx.theta));
%y
xN(idx.y) = states(idx.y) + params.dt * u(idx.v) * sin(states(idx.theta));
%theta
xN(idx.theta) = states(idx.theta) + params.dt * u(idx.w);

end