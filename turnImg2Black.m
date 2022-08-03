function [BWI] = turnImg2Black(img)
    %This function takes an image, of any type and will combine all its RGB
    %layers to one layer and will convert it to black and white
    %img is the colored img argument, and BWI is the black and white image
    img = im2double(img);
    R = img(:,:,1); %get red elements
    G = img(:,:,2); %get green elements
    B = img(:,:,3); %get black elements
    
    BWI = 0.2989*R+ 0.5870* G + 0.1140*B; %resulted image is black and white
end
