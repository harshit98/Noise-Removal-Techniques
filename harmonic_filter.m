function [ y ] = harmonic_filter( img )
%harmmean
im_size=size(img);
if length(im_size) == 2
    im_size = [im_size 1];
end
y = zeros(size(img));
img = double(img);
for i = 1:im_size(1)
    for j = 1:im_size(2)
        for k = 1:im_size(3)
            temp = [];
            for m = -1:1
                for n = -1:1
                    if (i + m > 0 && i + m < im_size(1) && j + n > 0 && j + n < im_size(2) && 1 + m > 0 && 1 + m < im_size(1) && 1 + n > 0 && 1 + n < im_size(2))
                        temp = [temp img(i+m, j+n,k)];
                        
                    end
                end
            end
            
            y(i,j,k) = round(harmmean(temp));
            
        end
    end
end
end

