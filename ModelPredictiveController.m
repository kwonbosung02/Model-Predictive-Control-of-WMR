function states_ = ModelPredictiveController(simNum,idx,params,states,data)
    
    num.simNum = simNum; %k
    
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
    %d = get_dMatrix(states, Acond,idx, params, num, data)
    %quadProgb = get_quadProgb(states, idx, params, num, data);
    
    u = quadprog(H, f, params.quadProgA,params.quadProgb);
    
    
    states_ = get_NextStates(states,idx, params,u);
    
    

end