function OUT = convo_(img,kernel)
    %img is the given photo after opening it with imread
    %mask is the kernel in which you want to filter the image
    %img = imread(img); %read Image
    %The image is converted to black and white in order to show feasibilty
    %of the image
    img = im2double(img); 
    %save img and kernel dimensions I saved dim because otherwise it multiplies col*3
    [Row,Col,dim] = size(img);  
    [KRow, KCol] = size(kernel);
    %pad image with zeros according to kernel
    new_img = zeros(Row+KRow-1, Col + KCol -1); 
    BWI = turnImg2Black(img);
    %insert BWI as matrix and keep on the padding zeros for convolution
    new_img(KRow:end,KCol:end) = BWI; 
    
    I = make_conv_mat(Row+KRow-1, Col + KCol -1,kernel);
    %Take image elements row piecwise left to right and put as a column vector
    vec = mat2vec(new_img); 
    output_vec = I*vec;
    step = size(output_vec,1)/size(new_img,2);
    %reshape output_Vec as a matrix - taking column vector and arranging it
    %by rows
    OUT=reshape(output_vec,[],[step]);
    %subplot(2,1,2), imshow(OUT.');
    imshow(OUT.');
    
    %********Un mark the below lines to try and converge to the real BW
    %********photo after applying the filter to it. This uses kachmarch 
    %********numerical analysis algorithm for finding approximated solution 
    %********for a set of linear equations, aka the photo matrix rows.
    %********It is a pretty slow algorithm, might want to use something
    %********else

    
    %now find image from convolution column vector using kachmarch
    %Solution = kachmarz(I.', output_vec,300,1000);
    %X = reshape(Solution, [size(new_img,2)], []);
    %imshow(X.');
end
