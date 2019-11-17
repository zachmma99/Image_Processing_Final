%Bilateral Filter for Smoothing an image. This is one of the steps to
%cartoonizing an image. Here, we are using MathWorks recommended method of
%bilater filtering using I - image to filter, degreeOfSmoothing (DoS), and
%spatialSigma - standard feviation of spatial Gaussian smoothing kernel
%-Leslie

function B = bilateralfilter(I,sigma)
    
    %colorscale - test
    I = imread('coloredCircles.png');
    imshow(I);
    
    imLAB = rgb2lab(I);
    
    patch = imcrop(imLAB, [34, 71, 60, 55]);
    patchSq = patch.^2;
    eucdist = sqrt(sum(patchSq,3));
    
    patchVar = std2(eucdist)^2;
    
    DoS = 4*patchVar;
    %bilateral filtering with Gaussian
    smoothed = imbilatfilt(imLAB,DoS,7);
    smoothedColor = lab2rgb(smoothed,'Out','uint8');
    montage({I,smoothedColor})
    %B = imbilatfilt(I, DoS, sigma);
    
    
end
