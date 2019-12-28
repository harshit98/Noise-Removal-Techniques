function [ per ] = try_all_filter( I,org_I )
    per = zeros(1,9);

    % 3 x 3 Arithmetic Mean Filter
    h = fspecial('average', 3);
    img_ar = imfilter(I, h);
    per(1) = err_per(org_I,img_ar);

    img_geo=geometric_filter(I);
    per(2) = err_per(org_I,img_geo);

    im_har = harmonic_filter(I);
    im_har= I+uint8(im_har);
    per(3) = err_per(org_I,im_har);

    Q=-2;
    im_contra=contra_harmonic( I ,Q);
    per(4) = err_per(org_I,im_contra);

    im_med = medfilt3(I);
    per(5) = err_per(org_I,im_med);

    im_max = max_filter(I);
    per(6) = err_per(org_I,im_max);

    im_min = min_filter(I);
    per(7) = err_per(org_I,im_min);

    im_mid = mid_filter(I);
    per(8) = err_per(org_I,im_mid);

    im_alp = aplha_trim(I);
    im_alp= I+uint8(im_alp);
    per(9) = err_per(org_I,im_alp);

    per = abs(per);
end
