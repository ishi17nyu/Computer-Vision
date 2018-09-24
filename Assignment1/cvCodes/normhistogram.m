function [ Norm_InputIm_histogram] = normhistogram ( InputImage,Image_histogram)

Norm_InputIm_histogram = zeros(256,1);
r = size(InputImage,1);
c = size(InputImage,2);
resolution = r * c;
for i=1:size(Image_histogram)
    % normalized histogram pdf  
    Norm_InputIm_histogram(i)=Image_histogram(i)/resolution;  
end
		   
figure, bar(Norm_InputIm_histogram);
