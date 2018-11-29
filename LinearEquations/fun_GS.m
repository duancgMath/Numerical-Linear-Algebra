function [x,deta] = fun_GS(A,b)
n=size(A,1);
D=diag(diag(A));
B=D\(-tril(A,-1)-triu(A,1));
g=D\b;
x=b;
k=0; kmax=10;
while (k<kmax)&&(norm(A*x-b)>1e-10)
    for i=1:n
       x(i)=B(i,:)*x+g(i); 
    end
    k=k+1;
    deta(k)=norm(A*x-b);
end
end