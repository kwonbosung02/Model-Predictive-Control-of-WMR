function H = get_HessianMatrix(Bcond,idx,params,num)

H = 2 * (Bcond' * params.Qcond * Bcond + params.Rcond);


end