function ModelPredictiveController(states)

    [idx,params] = get_params();
    
    %time = params.Tinitial : params.T : params.Tfinal;
    
    %for k = time
    %    disp(k)
        
    %end
    
    [A,B] = get_DynamicMatrix(idx,params);
    
   % [Acond, Bcond] = getCondensedMatrix(idx,params);
    
   % [ H, J ] = getCostFunction(idx,params);
    
   % [ Aineq, Bineq] = getInequalityConstraint(idx,params);
    
    
%t = 0:0.01:10
 %   x = 2 * sin
  %  y = 2 - 2*cos


   % dx 
    
end