function n = normalise(im,Mo,VARo)
    if ~isa(im,'double'), im = double(im); end	
	im = im - mean(im(:));    
	im = im/std(im(:));      % Zero mean, unit std dev

	n = Mo + im*sqrt(VARo);
end

