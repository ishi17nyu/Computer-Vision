function [value] = bilinear( I, point )
  value = 1;
  value1 = -1;
  value2 = -1;
  
  if(size(point,2) == 1 && size(point,1) == 2)
      point = point';
  end
  
  b1 = floor(point);
  b2 = b1 + [0 1];
  b3 = b1 + [1 1];
  b4 = b1 + [1 0];
  
  t = point - b1;
  
  if(b1(2) > 0 && b1(2) <= size(I,1) && b1(1) > 0 && b1(1) <= size(I,2))
    if(b4(1) <= size(I,2))
      value1 = (1-t(1))*I(b1(2),b1(1)) + t(1)*I(b4(2),b4(1));
    else
      value1 = I(b1(2),b1(1));
    end
  else
    if(b4(2) > 0 && b4(2) <= size(I,1) && b4(1) > 0 && b4(1) <= size(I,2))
      value1 = I(b4(2),b4(1));
    end
  end
  if(b2(2) > 0 && b2(2) <= size(I,1) && b2(1) > 0 && b2(1) <= size(I,2))
    if(b3(1) <= size(I,2))
      value2 = (1-t(1))*I(b2(2),b2(1)) + t(1)*I(b3(2),b3(1));
    else
      value2 = I(b2(2),b2(1));
    end
  else
    if(b3(2) > 0 && b3(2) <= size(I,1) && b3(1) > 0 && b3(1) <= size(I,2))
      value2 = I(b3(2),b3(1));
    end
  end
  if(value1 == -1 || value2 == -1)
    if(value1 == -1 && value2 == -1)
      value = 1;
    else
      if(value1 ~= -1 && value2 == -1)
        value = value1;
      else
          if(value1 == -1 && value2 ~= -1)
            value = value2;
          end
      end
    end
  else
    value = (1-t(2))*value1 + t(2)*value2;
  end
end

