function states_ = ModelPredictiveController(simNum,idx,params,states,data)
    
    num.simNum = simNum; %k
    
    for hornum = 1 : idx.n_hor
        
    num.horNum = hornum;    
    [Adyn,Bdyn] = get_DynamicMatrix(num,idx,params,data,states);
    A{hornum} = Adyn; %(k|k) (k+1|k) ... (k + horizon -1 | k)
    B{hornum} = Bdyn; %(k|k) (k+1|k) ... (k + horizon -1 | k)
    
    end
    
    [Acond, Bcond] = get_CondensedMatrix(A,B,idx,params);
    
    H = get_HessianMatrix(Bcond,idx,params,num);
    H = (H + H') / 2 ;
    f = get_fMatrix(Acond,Bcond,states,idx,params, num, data);
    %d = get_dMatrix(states, Acond,idx, params, num, data)
    %quadProgb = get_quadProgb(states, idx, params, num, data);
    
    u = quadprog(H, f, params.quadProgA,params.quadProgb);
    
    
    states_ = get_NextStates(states,idx, params, u);
    
    

end