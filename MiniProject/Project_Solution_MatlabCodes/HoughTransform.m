function [Pout,P,Th_Image] = HoughTransform( EdgeMap , InputImage ,thres)
    maxRho = round(sqrt((size(EdgeMap,1)/2)^2 + (size(EdgeMap,2)/2)^2) + 1);
    minRho = -maxRho;
    P = zeros(maxRho-minRho,200);
    cntrX = size(EdgeMap,2) / 2;
    cntrY = size(EdgeMap,1) / 2;
    
    for i =1:size(EdgeMap,1)
        for j =1:size(EdgeMap,2)
            if(EdgeMap(i,j) > 1)
                x = j - cntrX;
                y = size(EdgeMap,1) - i - cntrY;
                for tCount = 0:199
                    rho = floor(x*cos(tCount*pi/200) + y*sin(tCount*pi/200));
                    rho = rho - minRho + 1;
                    P(rho,tCount+1) = P(rho,tCount+1) + 1;
                end
            end
        end
    end
    
    mnP = min(min(P));
    mxP = max(max(P));
    Pout = zeros(size(P,1),size(P,2));
    
    for i=1:size(P,1)
        for j=1:size(P,2)
            Pout(i,j) = (255/(mxP-mnP+1))*(P(i,j)-mnP+1);
        end
    end
    
    P = nonmaxsupRadial(P,5);
    Th_Image = threshold(P,thres);
    
    hold on;
    imshow(InputImage,[min(min(InputImage)) max(max(InputImage))]);
    hold on;
    for row=1:size(Th_Image,1)
        for col = 1:size(Th_Image,2)
            if(Th_Image(row,col) > 1)
                theta = (col-1)*pi/200;
                rho = row - 1 + minRho;
                x = -cntrX:1:cntrX;
                disp(strcat('(', num2str(rho), ',', num2str(theta), ')'));
                if(abs(sin(theta)) < eps)
                    x=ones(1,2*cntrY+1)*rho;
                    y=-cntrY:1:cntrY;
                    x = x + cntrX;
                    y = size(EdgeMap,1) - y - cntrY;
                else
                    y = -x*cot(theta) + rho/sin(theta); 
                    x = x + cntrX;
                    y = size(EdgeMap,1) - y - cntrY;
                end
                hold on;
                plot(x,y);
                hold on;
            end
        end
    end
    axis([0 2*cntrX 0 2*cntrY]);
end

