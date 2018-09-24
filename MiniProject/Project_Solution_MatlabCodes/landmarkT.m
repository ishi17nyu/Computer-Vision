function [outputImage] = landmarkT( S, T, interpolation)

figure(121)
imshow(S);
[x,y] = getpts;
figure(122)
imshow(T)
[x2,y2] = getpts;

X = [ x(1),y(1),1,0,0,0;
      0,0,0,x(1),y(1),1;
      x(2),y(2),1,0,0,0;
      0,0,0,x(2),y(2),1;
      x(3),y(3),1,0,0,0;
      0,0,0,x(3),y(3),1]
X2=[x2(1),y2(1),x2(2),y2(2),x2(3),y2(3)];
p = gauss_elimination(X,X2);

if(interpolation == 2)
    outputImage = blaffine(S, p(1),p(2),p(4),p(5),p(3),p(6));
else
    outputImage = nnaffine(S, p(1),p(2),p(4),p(5),p(3),p(6));
end

end