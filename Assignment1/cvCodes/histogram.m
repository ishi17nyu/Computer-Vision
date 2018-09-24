function [ Image_histogram] = histogram ( image, nbins, min, max)

% Create a array of size n.
binsize = (max - min)/nbins;
Image_histogram = zeros(256,1);
for i=1:1:size(image,1)
	 for j=1:1:size(image,2)      
		val=image(i,j); 
        %read input image level    
		if val >= min && val <= max
		    for i=1:1:nbins 
		        if val <= i*binsize+min && val > (i-1)*binsize+min   
			    % original histogram in pixels
		           Image_histogram(i)=Image_histogram(i)+1;  
		        end
		    end
		end
	end
end

subplot(2,3,1) , imshow(image);
title("Image");
subplot(2,3,2),bar(Image_histogram);
title("Image Histogram");