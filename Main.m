function out = Main()

%index and parameters
[idx, params] = get_params();
data = get_Data()

%initial state
states = params.startState;

%iteration number
iterNum = params.iterNum;


for simNum  = 1 : iterNum
    
     ModelPredictiveController(simNum,idx,params,states,data);
     
    
end



end