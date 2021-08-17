function f = get_fMatrix(Acond,Bcond,states,idx,params)
x = Bcond';

for i = 1 : idx.n_hor
    for j = 1 : idx.n_hor
        x{i,j} = 2*x{i,j}*params.Qunit
        
    end
end
f = 0
end