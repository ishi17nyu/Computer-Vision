function [OutputImage] = blaffine( InputImage, a, b, c, d, x0, y0 )

  OutputImage = ones(size(InputImage,1),size(InputImage,2));
  T = [a b x0; c d y0; 0 0 1];
  T
  for i = 1 : size(InputImage,1)
    for j = 1 : size(InputImage,2)
      point = [ j i 1]';
      point = T\point;
      point = [point(1)/point(3) point(2)/point(3)];
      OutputImage(i,j) = bilinear(InputImage, point);
    end
  end
end

