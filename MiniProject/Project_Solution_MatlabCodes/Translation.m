function [O] = Translation( I, dx, dy , interpolation)
   if (interpolation == 2) 
       O = blaffine(I, 1, 0, 0, 1, dx, dy);  
   else
       O = nnaffine(I, 1, 0, 0, 1, dx, dy);  
   end
       
    subplot(2,2,1) , imshow(I) ;
    title("Actual Image");
    subplot(2,2,2) , imshow(uint8(O));
    title("Translated Image");
end
