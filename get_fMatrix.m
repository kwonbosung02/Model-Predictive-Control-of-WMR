function f = get_fMatrix(Acond,Bcond,states,idx,params,num,data)

f = 2 * Bcond' * params.Qcond * Acond * (states-data.states(:,num.simNum));
end