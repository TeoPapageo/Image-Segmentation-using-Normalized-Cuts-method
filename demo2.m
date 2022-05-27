clear;
clc;
rng(1);


matObj = matfile('dip_hw_2.mat');
varlist = who(matObj);

d2a = matObj.d2a;
d2b = matObj.d2b;
%%
myAffinitytMat1 = Image2Graph(d2a);

clusterIdx1a = myGraphSpectralClustering(myAffinitytMat1, 3);

clusterIdx1b = myGraphSpectralClustering(myAffinitytMat1, 4);

%%
myAffinitytMat2 = Image2Graph(d2b);

clusterIdx2a = myGraphSpectralClustering(myAffinitytMat2, 3);

clusterIdx2b = myGraphSpectralClustering(myAffinitytMat2, 4);


%%
M1 = reshape(clusterIdx1a,50,50);
RGB1 = label2rgb(M1);

M2 = reshape(clusterIdx1b,50,50);
RGB2 = label2rgb(M2);
    
figure
subplot(1,2,1), imshow(RGB1);
title('d2a, k = 3');

subplot(1,2,2), imshow(RGB2);
title('d2a, k = 4');
%%
M3 = reshape(clusterIdx2a,50,50);
RGB3 = label2rgb(M3);

M4 = reshape(clusterIdx2b,50,50);
RGB4 = label2rgb(M4);

figure
subplot(1,2,1), imshow(RGB3);
title('d2a, k = 3');

subplot(1,2,2), imshow(RGB4);
title('d2a, k = 4');

