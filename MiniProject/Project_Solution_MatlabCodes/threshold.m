function threshold_image = threshold( InputImage, threshold)
  OutputImage = ones(size(InputImage,1),size(InputImage,2));

  for i = 1 : size(InputImage,1)
    for j = 1 : size(InputImage,2)
        if(InputImage(i,j) >= threshold)
            OutputImage(i,j) = InputImage(i,j);
        end
    end
  end
max_thresh = max(OutputImage(:));
threshold_image = uint8((double(OutputImage) ./ max_thresh) .* 255);  
end
