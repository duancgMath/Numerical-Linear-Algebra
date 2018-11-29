function x = fun_grad(A, b)
n=size(A,1);
x=zeros(n,1);
r=b-A*x;
while norm(r)>1e-10
   a=(r'*r)/(r'*A*r);
   x=x+a*r;
   r=b-A*x;
end
end