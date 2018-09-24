function [x] = gauss_elimination(A,b)
n=length(b);

for p=1:n
    vec=[(1:p-1) n (p:n-1)];
    test=1;
    while A(p,p)==0
        if test==n
            error('Cannot invert matrix')
        end
        A=A(vec,:);
        b=b(vec);
        test=test+1;
    end
    b(p)=b(p)/A(p,p);
    A(p,:)=A(p,:)/A(p,p);
    for q=p+1:n
        b(q)=b(q)-A(q,p)*b(p);
        A(q,:)=A(q,:)-A(q,p)*A(p,:);
    end
end

x=zeros(n,1);
x(n)=b(n);
for p=n-1:-1:1
    x(p)=b(p);
    for q=p+1:n
        x(p)=x(p)-A(p,q)*x(q);
    end
end

            
