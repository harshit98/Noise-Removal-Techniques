function [ z ] = mid_filter( I )
    temp = size(I);
    m = temp(1);
    n = temp(2);

    if length(temp)==2
        h=1;
    else
        h=3;
    end

    c = ones(3,3) / 9;
    [p,q] = size(c);
    p = (p-1)/2;
    q = (q-1)/2;
    z = I;

    for i = p+1:m-p
        for j = q+1:n-q
            for k1 = 1:h
                mask1 = zeros(3,3);

                for k = -p:p
                    for l = -q:q
                        mask1(p+1-k, q+1-l) = I(i-k, j-l,k1);
                    end
                end

                mid1 = mask1(:);
                mid1 = (min(mid1) + max(mid1)) / 2;
            
                z(i,j,k1) = mid1;
            end
        end
    end
end
