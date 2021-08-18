function [Acond, Bcond] = get_CondensedMatrix(A,B,idx,params)
    
%get A condensed Matrix
Ax = 1;
   
for i = 1 : idx.n_hor
    Ax = Ax * A{i};
    Acond{i} = Ax;
end
Acond = Acond';
Acond = cell2mat(Acond);

    %get B condensed Matrix

Bcond = cell(idx.n_hor,idx.n_hor);
for i = 1 : idx.n_hor
    for j = 1 : idx.n_hor
        if(i < j)
            Bcond{i,j} = [0 0; 0 0; 0 0;];
        end
        if(i >= j)
            Bcond{i,j} = B{j};
        end
        
    end    
end

Ax = 1;
for j = 1 : idx.n_hor
    for i = 1 : idx.n_hor
       if(i>j)
           
            Ax = Ax * A{i} ;
            Bcond{i,j} = Ax * Bcond{i,j} ;
       end
    end
    Ax = 1;
end
Bcond = cell2mat(Bcond);

end