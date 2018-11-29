function [x,deta] = fun_Jacobi(A,b)
n=size(A,1);
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
B=D\(L+U);
g=D\b;
x=b;%x=zeros(n,1);
k=0; kmax=10;
while (k<kmax)&&(norm(A*x-b)>1e-10)
    x=B*x+g;
    k=k+1;
    deta(k)=norm(A*x-b);
end
end