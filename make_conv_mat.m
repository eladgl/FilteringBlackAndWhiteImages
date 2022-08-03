function I = make_conv_mat(Row,Col,kernel)
    %make_conv_mat is a function that returns 2d convolution matrix by given
    %filter/kernel
    %Row and Col are the requested image's dimension we do the convolution upon
    %kernel is the filter/mask we do the filtering to
    %notice that "I" will be of dimensions (Row*(Kernel.col-1 + KerCol), Row*Col)
    %the reason the size is getting bigger is due to padding the endings
    %this code will create from given kernel, two vectors that will create
    %toeplitz blocked matrix:      F_0  0   0  ...   0
    %                              F_1 F_0  0  ...   0
    %                              F_2 F_1 F_0 ...   .
    %  Dimensions are:              .   .      .     .
    %  (I)mxn, Kernel(txs)          .   .        .   .
    %  (I*Kernel) m*(n+s-1)x(m*n)   .   .          . 0
    %                              F_n F_n-1    ... F_0     
    
    [KerRow,KerCol] = size(kernel);
    vector = zeros(Row*Col,1); %this part will help us calculate the convulation by creating toeplitz blocks
    vector(1) = kernel(end,end);  %first element is Kernel's last element
    %vector(1:KerCol) = fliplr(kernel(end,:)); %Try out
    second_vector=zeros((Col)*(Row+KerCol)-Col,1);
    
    %save rows of kerenel from back to front, bottom to up right to left
    i = 1;
    for row=KerRow:-1:1
       second_vector(i:(i+KerCol-1)) = fliplr(kernel(row,:));  
       i = i + Col+KerCol-1;                                  
    end
    
   %create Sparse toeplitz matrix from row and column vector
   I = sptoeplitz(second_vector,vector);  
end
