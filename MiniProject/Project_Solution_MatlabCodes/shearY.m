function [OutputImage] = shearY(InputImage, shy, interpolation)
  if(interpolation == 2)
    OutputImage = blaffine(InputImage, 1, 0, shy, 1, 0, 0);
  else
    OutputImage = nnaffine(InputImage, 1, 0, shy, 1, 0, 0);
  end
  
  subplot(2,2,1) , imshow(InputImage) ;
  title("Actual Image");
  subplot(2,2,2) , imshow(uint8(OutputImage));
  title("Shear Image");
end


