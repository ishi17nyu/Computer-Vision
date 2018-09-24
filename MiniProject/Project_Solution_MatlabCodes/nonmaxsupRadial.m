function output = nonmaxsupRadial( I , n )
    O = zeros(size(I,1),size(I,2));
    
    %edge cases preserved
    for i=1:size(I,1)
      for j=1:size(I,2)
          O(i,j) = I(i,j);
      end
    end
    
    for row=1+floor(n/2):size(I,1)-floor(n/2)
        for col=1+floor(n/2):size(I,2)-floor(n/2)
            if(IsLocalMaxRadial(I(row-floor(n/2):row+floor(n/2),col-floor(n/2):col+floor(n/2)), n))
                O(row,col) = I(row,col);
            else
                O(row,col) = 0;
            end
        end
    end
        
    mnO = min(min(O));
    mxO = max(max(O));
    output = zeros(size(O,1),size(O,2));
    
    for i=1:size(O,1)
        for j=1:size(O,2)
            output(i,j) = (255/(mxO-mnO+1))*(O(i,j)-mnO+1);
        end
    end
end

