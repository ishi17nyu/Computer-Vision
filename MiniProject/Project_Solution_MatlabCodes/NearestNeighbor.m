function [ value ] = NearestNeighbor(Image, Point)
nearest_point = round(Point);
value = 1;
if(nearest_point(2) > 0 && nearest_point(2) < size(Image,1) && nearest_point(1) > 0 && nearest_point(1) < size(Image,2))
    value = Image(nearest_point(2) , nearest_point(1));
end
end





