%% upper Hessenberg
function [H,Q]=fun_hessen(H)
n=size(H,1);
Q=eye(n);
for k=1:n-2
   [v,b]=fun_house(H(k+1:n,k));
   H(k+1:n,k:n)=H(k+1:n,k:n)-b*v*v'*H(k+1:n,k:n);
   H(1:n,k+1:n)=H(1:n,k+1:n)-b*H(1:n,k+1:n)*v*v';
   Q(1:n,k+1:n)=Q(1:n,k+1:n)-b*Q(1:n,k+1:n)*v*v';
end
end