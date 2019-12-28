function [ percentage ] = err_per( img1,img2 )
    error = uint8(img1)-uint8(img2);
    percentage = (mean(mean(mean(error)))/mean(mean(mean(img1))))*100;
end
