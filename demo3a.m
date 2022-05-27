clear;
clc;
rng(1);


matObj = matfile('dip_hw_2.mat');
varlist = who(matObj);

d2a = matObj.d2a;
d2b = matObj.d2b;

%%
[N1,N2,~] = size(d2a);
myAffinitytMat1 = Image2Graph(d2a);

clusterIdx1 = myGraphSpectralClustering(myAffinitytMat1, 2);

nCutValue1 = calculateNcut(myAffinitytMat1 , clusterIdx1);

disp('Ncut value 1 is:');
disp(nCutValue1);

M1 = reshape(clusterIdx1,N1,N2);
RGB1 = label2rgb(M1);

figure
imshow(RGB1);

%%
[N3,N4,~] = size(d2a);
myAffinitytMat2 = Image2Graph(d2b);

clusterIdx2 = myGraphSpectralClustering(myAffinitytMat2, 2);

nCutValue2 = calculateNcut(myAffinitytMat2 , clusterIdx2);

disp('Ncut value 2 is:');
disp(nCutValue2);

M2 = reshape(clusterIdx2,N3,N4);
RGB2 = label2rgb(M2);

figure
imshow(RGB2);