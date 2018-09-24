function [O] = non_maxSuppression( E,a)
    O = zeros(size(E,1),size(E,2));
    
    for row=2:size(E,1)-1
        for col=2:size(E,2)-1
            if(IsLocalMax(E(row-1:row+1,col-1:col+1),a(row,col)))
                O(row,col) = E(row,col);
            else
                O(row,col) = 0;
            end
        end
    end
        
    mnO = min(min(O));
    mxO = max(max(O));
    Oout = zeros(size(O,1),size(O,2));
    
    for i=1:size(O,1)
        for j=1:size(O,2)
            Oout(i,j) = (255/(mxO-mnO+1))*(O(i,j)-mnO+1);
        end
    end
    
end

