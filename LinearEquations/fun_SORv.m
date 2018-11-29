function [x,deta] = fun_SORv(A,b,w)
n=size(A,1);
x=b;%zeros(n,1);
L=-tril(A,-1);
U=-triu(A,1);
D=diag(diag(A));
B=inv(D)*(L+U);
g=inv(D)*b;
k=0; kmax=150;
while (k<kmax)&&(norm(A*x-b)>1e-10)
    k=k+1;
    for i=1:n
      x(i)=(1-w)*x(i)+w*(B(i,1:i-1)*x(1:i-1)+B(i,i+1:n)*x(i+1:n)+g(i));
    end
    deta(k)=norm(A*x-b);
end
end