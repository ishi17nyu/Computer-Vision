function [edge_map,orientation] = edgeDetection( InputImage, weight1, weight2)
r = size(InputImage ,1 );
c = size(InputImage ,2);
x_derivative = zeros(r,c);
y_derivative = zeros(r,c);
edge_map = zeros(r,c);
orientation = zeros(r,c);
weight = [1 1 1 ; 1 1 1; 1 1 1]/9;
smoothed_image = smoothing(InputImage,weight,false);
for i = 1 : size(InputImage,1)
    for j = ceil(size(weight1,2)/2) : (size(InputImage,2) - ceil(size(weight1,2)/2) + 1)
        convol=0;
        for a = 1:size(weight1,2)
            w = weight1(a);
            im = smoothed_image(i,j-a+ceil(size(weight1,2)/2));
            x = w * im;
            convol = convol + x;
        end
        x_derivative(i,j)= abs(convol);
    end
end

for i = ceil(size(weight2,1)/2) : (size(InputImage,1) - ceil(size(weight2,1)/2) + 1)
    for j = 1 : size(InputImage,2)
        convol_vertical=0;
        for b = 1:size(weight2,1)
            w = weight2(b);
            im = smoothed_image(i-b+ceil(size(weight2,1)/2),j);
            y = w * im;
            convol_vertical = convol_vertical + y;
        end
        y_derivative(i,j)=abs(convol_vertical);
    end
end

for i = ceil(size(weight1,2)/2): (size(InputImage,1) - ceil(size(weight1,2)/2) + 1)
    for j = ceil(size(weight1,2)/2): (size(InputImage,2) - ceil(size(weight2,1)/2) + 1)
        edge_map(i,j)=sqrt(x_derivative(i,j)^2+y_derivative(i,j)^2);
        orientation(i,j)=atan(y_derivative(i,j)/x_derivative(i,j))*(360/pi);
    end
end
subplot(2,2,1) ,imshow(uint8(x_derivative),gray);
title("dx");
subplot(2,2,2) , imshow(uint8(y_derivative),gray);
title("dy");
subplot(2,2,3) , imshow(uint8(edge_map),gray);
title("edge Map");
subplot(2,2,4) , imshow(uint8(orientation),gray);
title("Orientation Angle");
