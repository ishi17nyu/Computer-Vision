function [OutputImage] = ScaleImage( InputImage, cx, cy, interpolation)
  if(interpolation == 2)
    OutputImage = blaffine(InputImage, cx, 0, 0, cy, 0, 0);
  else
    OutputImage = nnaffine(InputImage, cx, 0, 0, cy, 0, 0);
  end
  
    subplot(2,2,1) , imshow(InputImage) ;
    title("Actual Image");
    subplot(2,2,2) , imshow(uint8(OutputImage));
    title("Scaled Image");
end

