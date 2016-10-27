%Otsu Method
im=imread('rice.png'); %imread to upload image
imshow(im)  
se=strel('disk',15) %create disk shaped structuring element with radius of 15 pixels. 
background = imopen(im,se);%to get the background of the image perform opening 
im2 = im - background;%remove background from the image 
figure(2)
imshow(im2)

im3 = imadjust(im2); %adjusts contrast
figure (3) 
imshow(im3)

bw = imbinarize(im3); %make im3 a binary image 
bw = bwareaopen(bw, 50); %removes all connected components (objects)
%that have fewer than P pixels from the binary image BW,

figure(4)
imshow(bw)


cc = bwconncomp(bw, 4) 
%CC = bwconncomp(BW,conn) returns the connected components where conn
%specifies the desired connectivity (4,8) for the connected components.


grain = false(size(bw)); %false logical 0- change everything to 0 in size of image 
grain(cc.PixelIdxList{50}) = true; %change only the 50th connected item to 1
figure (5) 
imshow(grain);

L = labelmatrix(cc)%creates a label matrix from the connected components 
                    %structure CC returned by bwconncomp.


RGB_label = label2rgb(L, @spring, 'c', 'shuffle');
figure(6) 
imshow(RGB_label)

%stats = regionprops(RGB_label,properties)







