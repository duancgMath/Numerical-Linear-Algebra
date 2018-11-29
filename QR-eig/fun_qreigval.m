%% get eigenvalue from real Schur form
function x = fun_qreigval(H)
n=size(H,1);
x=zeros(n,1);
k=n;
while k>2
   if H(k,k-1)==0
       x(k)=H(k,k);
       k=k-1;
   else
       b=-H(k-1,k-1)-H(k,k);
       c=H(k-1,k-1)*H(k,k)-H(k-1,k)*H(k,k-1);
       delta=b*b-4*c;
       x(k-1)=(-b+sqrt(delta))/2;
       x(k)=(-b-sqrt(delta))/2;
       k=k-2;
   end
end

if k==2 && H(2,1)==0
    x(2)=H(2,2);
    x(1)=H(1,1);
elseif k==1
    x(1)=H(1,1);
else
    b=-H(1,1)-H(2,2);
    c=H(1,1)*H(2,2)-H(1,2)*H(2,1);
    delta=b*b-4*c;
    x(2)=(-b+sqrt(delta))/2;
    x(1)=(-b-sqrt(delta))/2;
end

end