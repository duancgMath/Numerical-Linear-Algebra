n=10;
A=rand(n);
A=A+A'+2*n*eye(n);
b=rand(n,1);

D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
B=D\(L+U);
r=vrho(B);
w_=2/(1+sqrt(1-r^2));

[x,deta1]=fun_SORv(A,b,);
[x,deta2]=fun_GS(A,b);
plot(deta1,'-r')
hold on
plot(deta2,'-b')
