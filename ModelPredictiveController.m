function states_ = ModelPredictiveController(simNum,idx,params,states,data)
    
    
    num.simNum = simNum;
    
    n_hor = idx.n_hor;
    
    for hornum = 1 : n_hor
        
    num.horNum = hornum;    
    [Adyn,Bdyn] = get_DynamicMatrix(num,idx,params,data);
    A{hornum} = Adyn; 
    B{hornum} = Bdyn;
    
    end
    
    [Acond, Bcond] = get_CondensedMatrix(A,B,idx,params);
    
    H = get_HessianMatrix(Bcond,idx,params,num);
    f = get_fMatrix(Acond,Bcond,states,idx,params, num, data);
    d = get_dMatrix(states, Acond,idx, params, num, data)
    
    u = quadprog(H, f, params.quadProgA, params.quadProgb);
    disp(u);
    %fix required
    xN = get_NextStates(states,idx, params,u);
    
    states_ = xN(1:3,:);

end