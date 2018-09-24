function [OutputImage] = nnaffine( InputImage, a, b, c, d, x0, y0 )

  OutputImage = ones(size(InputImage,1),size(InputImage,2));
  
  T = [a b x0; c d y0; 0 0 1];
  T
  for i = 1 : size(InputImage,1)
    for j = 1 : size(InputImage,2)
        point = [j i 1]';
        new_v = T\point;
        intensity = NearestNeighbor(InputImage,new_v);
        OutputImage(i,j) = intensity;
    end
  end
end