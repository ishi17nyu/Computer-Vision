function [OutputImage] = Rotation( InputImage, theta, interpolation)
  if(interpolation == 2)
    OutputImage  = blaffine(InputImage, cos(theta), -sin(theta), sin(theta), cos(theta), 0, 0);  
  else
    OutputImage = nnaffine(InputImage, cos(theta), -sin(theta), sin(theta), cos(theta), 0, 0);
  end
  
    subplot(2,2,1) , imshow(InputImage) ;
    title("Actual Image");
    subplot(2,2,2) , imshow(uint8(OutputImage));
    title("Rotated Image");
end