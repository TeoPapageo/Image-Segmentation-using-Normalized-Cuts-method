clc;
clear;

rng(1);


matObj = matfile('dip_hw_2.mat');
varlist = who(matObj);

d1a = matObj.d1a;
%%
clusterIdx1 = myGraphSpectralClustering(d1a, 2);

disp(clusterIdx1);
%%
clusterIdx2 = myGraphSpectralClustering(d1a, 3);

disp(clusterIdx2);
%%
clusterIdx3 = myGraphSpectralClustering(d1a, 4);

disp(clusterIdx3);