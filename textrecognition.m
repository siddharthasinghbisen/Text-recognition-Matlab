Imageinput = imread('testingimage.jpg'); %%to take image as input
figure(1)
imshow(Imageinput);
title('Input image with noise')%%To display the image as it is
if size(Imageinput,3)== 3
    Imageinput=rgb2gray(Imageinput);%%to convert rgb image to gray scale
end
Threshold = graythresh(Imageinput);
Imageinput = ~im2bw(Imageinput,Threshold); %%to convert igrayscale image to binary image
Imageinput = bwareaopen(Imageinput,30);%%to remove all objects less than 30 pixels
pause(1);
[L, Ne] = bwlabel(Imageinput);%%connected components
propied = regionprops(L, 'BoundingBox');
imshow(~Imageinput);
hold on
for n=1:size(propied,1)
    rectangle('Position', propied(n).BoundingBox, 'EdgeColor','g', 'LineWidth', 2)%%to show the boudary box around the object 
end
hold off
pause(1);
figure
for n=1:Ne
    [r,c]=find(L==n);
    n1=Imageinput(min(r):max(r),min(c):max(c));
    imshow(~n1);
    pause(0.5)
end

    

