function [thinned, reliability, orient_img] = ridgeThin(img, display)
    w = 16; threshold = 0.1;
    [norm_img, mask] = ridgesegment(img, w, threshold);
    [orient_img, reliability] = ridgeorient(norm_img, 1, 5, 5);

    w = 36;
    [~, med_freq] = ridgefreq(norm_img, mask, orient_img, w, 5, 5, 15);
    freq = med_freq .* mask;

    filt_img = ridgefilter(norm_img, orient_img, freq, 0.5, 0.5, 0);
    
    bin_img = filt_img > 0;
    bin_img = ~bin_img;

    thinned = ~bwmorph(bin_img, 'skel', Inf);
    
    if display
        plotridgeorient(orient_img, 20, img, 1);
        show(filt_img, 2);
        show(thinned, 4);
    end
end