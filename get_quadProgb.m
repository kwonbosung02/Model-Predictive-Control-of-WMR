function b = get_quadProgb(states, idx, params, num, data)

u_min = [params.v_min; params.w_min];
u_max = [params.v_max; params.w_max];

v = sqrt(data.dx(num.simNum)^2 + data.dy(num.simNum)^2);

disp(data.dx(num.simNum));
disp(data.dy(num.simNum));
u_ref = [v; data.w(num.simNum)];

u_cond = vertcat(u_max-u_ref,-(u_min-u_ref));

for i = 1 : idx.n_hor

    b{i,1} = u_cond;
end
b = cell2mat(b);


end
