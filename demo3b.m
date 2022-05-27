clear;
clc;
rng(1);

matObj = matfile('dip_hw_2.mat');
varlist = who(matObj);

d2a = matObj.d2a;
d2b = matObj.d2b;

%%
[N1,N2,ch] = size(d2a);
N = N1*N2;

myAffinityMat1 = Image2Graph(d2a);

Seg1 = (1:N)';
[Seg1, Id1, nCut1] = NcutRepeat1(myAffinityMat1, Seg1, 0.6, 5, 'ROOT');

[~, sizeSeg1] = size(Seg1);

RGB1 = zeros(N1*N2,1);

label1 = zeros(sizeSeg1,1);

for i = 1:size(label1)
   label1(i) = i; 
end


for i = 1:sizeSeg1
    sizeSubSeg1 = size(Seg1(1,i));
    subSeg1 = cell2mat(Seg1(1,i));

    for j = 1:size(subSeg1)
        RGB1(subSeg1(j,1),1) = label1(i);
    end

end

Z1 = reshape(RGB1,N1,N2);
Z2 = label2rgb(Z1);

figure
imshow(Z2);


%%
[N3,N4,ch] = size(d2b);
NN = N3*N4;

myAffinitytMat2 = Image2Graph(d2b);

Seg2 = (1:NN)';
[Seg2, Id2, nCut2] = NcutRepeat1(myAffinitytMat2, Seg2, 0.9991, 40, 'ROOT');

[~, sizeSeg2] = size(Seg2);

RGB3 = zeros(N3*N4,1);

label2 = zeros(sizeSeg2,1);

for i = 1:size(label2)
   label2(i) = i; 
end


for i = 1:sizeSeg2
    sizeSubSeg2 = size(Seg2(1,i));
    subSeg2 = cell2mat(Seg2(1,i));
    for j = 1:size(subSeg2)
        RGB3(subSeg2(j,1),1) = label2(i);
    end
    
end

Z3 = reshape(RGB3,N3,N4);
Z4 = label2rgb(Z3, 'jet',[1,1,1],'noshuffle');

figure
subplot(2,2,1), imshow(Z4);
title('Ncuts');

subplot(2,2,2), imshow(d2b);
title('Original Image');

