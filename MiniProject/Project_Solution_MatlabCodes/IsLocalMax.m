function [tf] = IsLocalMax( p,a )

v1 = [2 2]' + [cos(a) sin(a)]';
v2 = [2 2]' + [cos(a+pi) sin(a+pi)]';

p1 = bilinear(p,v1);
p2 = bilinear(p,v2);

tf = ~(p(2,2) < p1 || p(2,2) < p2);
end