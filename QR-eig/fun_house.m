%% Householder 
function [v,b]=fun_house(x)
n=size(x,1); v=zeros(n,1);
eta=max(abs(x)); x=x/eta;
sigma=x(2:n)'*x(2:n);
v(1)=1; v(2:n)=x(2:n);
if sigma<1e-10
    b=0;
else
    alpha=sqrt(x(1)^2+sigma);
    if x(1)<=0
        v(1)=x(1)-alpha;
    else
        v(1)=-sigma/(x(1)+alpha);
    end
    b=2*v(1)^2/(sigma+v(1)^2); v=v/v(1);
end