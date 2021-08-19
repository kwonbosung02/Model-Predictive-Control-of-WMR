function [Acond, Bcond] = get_CondensedMatrix(A,B,idx,params)
    
%get A condensed Matrix
Ax = eye(3);
Acond = [];   
for i = 1 : idx.n_hor
    Ax = Ax * A{i};
    Acond = [Acond; Ax];
end

%get B condensed Matrix

Bcond = cell(idx.n_hor,idx.n_hor);
for i = 1 : idx.n_hor
    for j = 1 : idx.n_hor
        if(i < j)
            Bcond{i,j} = zeros(3,2);
        end
        if(i >= j)
            Bcond{i,j} = B{j};
        end
        
    end    
end

Ax = eye(3);
for j = 1 : idx.n_hor
    for i = 1 : idx.n_hor
       if(i>j)
           
            Ax = Ax * A{i} ;
            Bcond{i,j} = Ax * Bcond{i,j} ;
       end
    end
    Ax = eye(3);
end
Bcond = cell2mat(Bcond);
Bcond;
end