function [sol] = kachmarz(A,b,eps,n)
    [row,col] =size(A);
    count = 0;
    x=rand(row,1);  %start from a random row as x0
    C=A.';
    D = C.';
    while((count < n) && (eps <= norm(C*x-b))) 
        i = randi(col);
        B = D(:,i);
        if (~any(B, 'all')) %if vector is all zeros, skip it to avoid NAN or INF values
            count = count+1;
          continue  
        end
        x = x + ((b(i)- x.'*B)/(B.'*B)^2)*B;        
        count = count+1;
    end
    sol = x;
  end
