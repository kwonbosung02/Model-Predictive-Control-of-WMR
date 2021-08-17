function d = get_dMatrix(states, Acond,idx, params, num, data)
x = states - data.state(num.simNum + num.horNum - 1);
disp(x)
disp(Acond{1})

for i = 1 : idx.n_hor
    d{i} = 0
    for j = 1 : idx.n_hor
       d{i} = d{i} + x' * Acond{j} 
    end
    d{i} = d{i} * params.Qunit
end

disp(d)

end