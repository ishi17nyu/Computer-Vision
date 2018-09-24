function tf = IsLocalMaxRadial( p, size )


maxValue = max(max(p));

tf = (p(floor(size/2)+1,floor(size/2)+1) == maxValue);

end
