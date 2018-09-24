function [threshold_image] = threshold_image ( InputImage,threshold)
OutputImage = [];

for i=1:size( InputImage,1)
    for j=1:size( InputImage,2)
        value= InputImage(i,j);
        if value <= threshold
            OutputImage(i,j)=0;
        else
            OutputImage(i,j)=value;
        end
    end
end

%thresholded image
max_thresh = max(OutputImage(:));
threshold_image = uint8((double(OutputImage) ./ max_thresh) .* 255);