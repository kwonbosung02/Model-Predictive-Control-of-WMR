function xN = get_NextStates(states,idx, params, u)

xN = [0; 0; 0];
%x
xN(1) = states(1) + params.dt * u(1) * cos(states(3));
%y
xN(2) = states(2) + params.dt * u(1) * sin(states(3));
%theta
xN(3) = states(3) + params.dt * u(2);

end