function [smooth_img] = smoothing ( I, weight,display)

r = size(I,1);
c = size(I,2);
smooth_img = zeros(r,c);

for i = ceil(size(weight,1)/2): (size(I,1) - ceil(size(weight,1)/2) + 1)
    for j = ceil(size(weight,2)/2): (size(I,2) - ceil(size(weight,1)/2) + 1)
        convol=0;
        %compute convolution for the neighbourhood associated to the kernel
        for a = 1:size(weight,1)
            for b=1:size(weight,2)
                convol = convol + round((weight(a,b)*I(i-a+ceil(size(weight,1)/2),j-b+ceil(size(weight,2)/2))));
            end
        end
        smooth_img(i,j)=convol;
    end
end

if display
    subplot(2,2,1) , imshow(uint8(I));
    title("Original Image");
    subplot(2,2,2) , imshow(uint8(smooth_img));
    title("Smoothed Image");
end
   
