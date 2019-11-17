%Bilateral Filter for Smoothing an image. This is one of the steps to
%cartoonizing an image.
%-Leslie

function B = bilateralfilter(I,sigma)
    
    %specifying crop angle in matrix. Chose randomly- should we change?
    patch = imcrop(I, [80, 50, 30, 30]);
    imshow(patch);
    
    %standard deviation of matrix
    patchVar = std2(patch)^2;
    
    DegSmooth = 2*patchVar;
    %bilateral filtering with Gaussian
    J = imbilatfilt(I,DegSmooth);
    imshow(J);
    title(['Degree of Smoothing: ',num2str(DegSmooth)]);
    B = imbilatfilt(I, DegSmooth, sigma);
    
    
end
