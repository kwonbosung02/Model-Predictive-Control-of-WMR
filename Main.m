function out = Main()
close all
clear all
clc
%index and parameters
[idx, params] = get_params();
data = get_Data()

%initial state
states = params.startState;

%iteration number
iterNum = params.iterNum;

plot(data.x,data.y);

grid on 
hold on

for simNum  = 1 : iterNum %k
    
     states = ModelPredictiveController(simNum,idx,params,states,data);
    
     plot(states(idx.x),states(idx.y),'-o')
     out{simNum} = states;
     
     drawnow;   
     

     
end
out = cell2mat(out);
close all
plot(data.x,data.y);
grid on
hold on
plot(out(1,:),out(2,:));

end