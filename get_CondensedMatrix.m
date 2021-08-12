function [Acond, Bcond] = get_CondensedMatrix(A,B,idx,params)
    
%get A condensed Matrix
Ax = 1;
   
for i = 1 : idx.n_hor
    Ax = Ax * A{i};
    Acond{i} = Ax;
end
Acond = Acond';
    
%get B condesed Matrix
%set B value
Bcond = cell(idx.n_hor,idx.n_hor);
for i = 1 : idx.n_hor
    for j = 1 : idx.n_hor
        if(i < j)
            Bcond{i,j} = 0;
        end
        if(i >= j)
            Bcond{i,j} = B{j};
        end
        
    end    
end
%set A value on B value
Ax = 1;
for j = 1 : idx.n_hor
    for i = 1 : idx.n_hor
       if(i + j > idx.n_hor +1)
           continue
       end
       if(i>j)
            Ax = Ax * A{j+i-1} ;
            Bcond{i,j} = Ax * Bcond{i,j} ;
       end
    end
    Ax = 1;
end

end