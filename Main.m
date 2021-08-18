function out = Main()

%index and parameters
[idx, params] = get_params();
data = get_Data()

%initial state
states = params.startState;

%iteration number
iterNum = params.iterNum;

for simNum  = 1 : iterNum
    
     states = ModelPredictiveController(simNum,idx,params,states,data);
     plot(states(1),states(2),'-o')
     hold on
     drawnow;
end



end