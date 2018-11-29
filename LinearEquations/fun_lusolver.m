function x = fun_lusolver(A,b)
n=size(A,1);
for k=1:n-1
    [~,i] = max(abs(A(k:n,k)));
    i = k+i-1;
    A([k i],:) = A([i k],:);
    b([k i]) = b([i k]);
    if A(k,k) ~= 0
        A(k+1:n,k) = A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n) =  A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
    else
        stop
    end
end
for j = 1:n-1
   b(j+1:n) = b(j+1:n)-b(j)*A(j+1:n,j);
end
for j = n:-1:2
   b(j) = b(j)/A(j,j);
   b(1:j-1) = b(1:j-1)-b(j)*A(1:j-1,j);
end
b(1) = b(1)/A(1,1);
x = b;
end