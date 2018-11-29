%% Schur
function H=fun_schur(H)
n=size(H,1);
[H,~]=fun_hessen(H);
epsilon=1e-5;
m=0;
while 1
    for i=2:n 
        if abs(H(i,i-1))<=...
                (abs(H(i,i))+abs(H(i-1,i-1)))*epsilon
            H(i,i-1)=0;
        end
    end
    
    for k=n-m:-1:2 
        if abs(H(k,k-1))<epsilon
            m=m+1;
        elseif k==2
            m=m+2;
        elseif abs(H(k-1,k-2))<epsilon
            m=m+1; % match with for-loop
        else
            break
        end
    end

    l=0;
    for k=n-m:-1:2
        if H(k,k-1)==0
            l=k-1;
            break
        end
    end
    
    if m>=n-2
        break
    else 
        H(l+1:n-m,l+1:n-m)=...
            fun_qriter(H(l+1:n-m,l+1:n-m));
    end  
    
end

end