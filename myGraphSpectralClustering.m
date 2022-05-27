function [clusterIdx] = myGraphSpectralClustering(anAffinityMat, k)

[H, W] = size(anAffinityMat);

D = zeros(H,W);

for i=1:H
    for j = 1:W
        D(i,i) = D(i,i) + anAffinityMat(i,j);
    end
end

L = D - anAffinityMat;


[U,D] = eigs(L, D, k, 'SA');

labels = kmeans(U,k);

clusterIdx = labels;

end

