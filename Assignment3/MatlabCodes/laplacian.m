function [OutputImage] = laplacian( InputImage,threshold)


laplacian_kernel = [0 -1 0; -1 4 -1; 0 -1 0];
OutputImage = [];
%can use smoothing function for obtaining peaks
laplacian_image = smoothing(InputImage,laplacian_kernel,false);

for i=1:size( laplacian_image,1)
    for j=1:size( laplacian_image,2)
        value= laplacian_image(i,j);
        if value <= threshold
            OutputImage(i,j)=value;
        else
            OutputImage(i,j)=0;
        end
    end
end