function [correlated_image] = correlation ( InputImage, template)
[r1,c1]=size(InputImage);
[r2,c2]=size(template);
image22 = template-mean(mean(template));
correlated_image = [];

for i=1:(r1-r2+1)
    for j=1:(c1-c2+1)
        Nimage=InputImage(i:i+r2-1,j:j+c2-1);
        Nimage=Nimage-mean(mean(Nimage));  % mean of image part under mask
        corr = sum(sum(Nimage.* image22));
        norm = sqrt(sum(sum(Nimage.^2)))*(sum(sum(image22.^2)));
        correlated_image(i,j)=corr/norm;
    end 
end






