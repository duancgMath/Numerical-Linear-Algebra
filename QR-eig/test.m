%% test
clear
clc
n=5;

% % test house
% x=rand(n,1)
% [v,b]=fun_house(x);
% y=x-b*v*(v'*x)
% norm(x)-norm(y)

% % test hessen
% H=rand(n);
% [H_,Q]=fun_hessen(H);
% H_
% Q'*H*Q
% norm(H_-Q'*H*Q)

% % test dsqrite
% A=rand(n);
% [~,d]=eig(A);
% [A,~]=fun_hessen(A);
% for k=1:40
%     A=fun_dsqrite(A);
% end

% test schur
A=rand(n);
H=fun_schur(A);
x=fun_qreigval(H);
x=sort(x);
[~,d]=eig(A);
d=diag(d);
d=sort(d);
norm(x-d)