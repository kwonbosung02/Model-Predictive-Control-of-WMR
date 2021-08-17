function H = get_HessianMatrix(Bcond,idx,params,num)
%    H = 2*(Bcond.T * simNum * params.Qcond * Bcond + params.Rcond);


for i = 1 : idx.n_hor
    for j = 1 : idx.n_hor
        x = Bcond{i,j}' * (num.simNum+num.horNum-1) * params.Qunit * Bcond{i,j} + params.Rcond{i,j};
        H{i,j} = 2 * x;
    end
    
end
end