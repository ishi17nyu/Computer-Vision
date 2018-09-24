function [OutputImage] = imgeq( InputImage, Norm_InputIm_histogram )

r = size(InputImage ,1 );
c = size(InputImage ,2);
OutputImage = uint8(zeros(r,c));
norm_cumulsumvec = zeros(256,1);
norm_cumulsum = 0;
output = zeros(256,1);
levels = 255;
for i=1:size(Norm_InputIm_histogram)
	norm_cumulsum = norm_cumulsum + Norm_InputIm_histogram(i);
	norm_cumulsumvec(i)= norm_cumulsum;
    %formula: (L-1)*cdf%
	output(i)= round(norm_cumulsumvec(i)*levels); 
end

for i=1:size(InputImage,1)
    for j=1:size(InputImage,2)
        OutputImage(i,j)=output(InputImage(i,j)+1);       
    end
end

subplot(2,3,1) , imshow(InputImage);
title("Original Image");
subplot(2,3,2) , imshow(OutputImage);
title("Equalized Image");
subplot(2,3,3) , bar(output);
title("Equalization Histogram");




