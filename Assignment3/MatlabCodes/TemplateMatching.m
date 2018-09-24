function [] = TemplateMatching(InputImage, template)

%calculate norm correlation
correlate_Image = correlation ( InputImage, template);

%convert double image to gray levels
maxv1 = max(correlate_Image(:));
corr_image = uint8((double(correlate_Image) ./ maxv1) .* 255);

%Thresholded Image 
corr_threshold = 0.02;

threshold_peakdetection = threshold_image ( correlate_Image,corr_threshold);

%Laplacian Peak Detection
kernel = [1 1 1; 1 1 1; 1 1 1]/9;
smooth_image = smoothing(corr_image,kernel,false);
%Threshold on laplacian
threshold = 10;
peak_detected = laplacian(smooth_image,threshold);

%convert double image to gray levels
maxv2 = max(peak_detected(:));
peak_image = uint8((double(peak_detected) ./ maxv2) .* 255);

subplot(2,2,1) ,imshow(InputImage);
title("original Image");
subplot(2,2,2) , imshow(corr_image);
title("correlated Image");
subplot(2,2,3) , imshow(threshold_peakdetection);
title("Thresholded Image");
subplot(2,2,4) , imshow(peak_image);
title("Peak Detected Image");
