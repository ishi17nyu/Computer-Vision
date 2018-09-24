function [ out] = histogram_match ( img1, img2 )

a = histogram(img1, 255 , 0 ,255);
b = histogram(img2, 255 , 0 ,255);

pdf1 = normhistogram(img1,a);
pdf2 = normhistogram(img2,b);

a_cdf = cdf(pdf1);
b_cdf = cdf(pdf2);

M = zeros(256,1,'uint8');
for i = 1:256
    diff = abs(a_cdf(i) - b_cdf);
    [~,ind] = min(diff);
    M(i) = ind - 1;
end

out = M(double(img1)  + 1);

subplot(2,3,1) , imshow(img1);
title("Image1");
subplot(2,3,2) , imshow(img2);
title("Image2");
subplot(2,3,3) ,imshow(out);
title("Matched Image");
subplot(2,3,4) , bar(a);
title("Histogram1");
subplot(2,3,5), bar(b);
title("Histogram2");
subplot(2,3,6) , bar(out);
title("Matched Histogram");








