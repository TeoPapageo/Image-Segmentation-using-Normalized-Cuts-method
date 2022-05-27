function nCutValue = calculateNcut(anAffinityMat , clusterIdx)
[N1, N2] = size(anAffinityMat);


C = unique(clusterIdx);

assocA_V = 0;
assocB_V = 0;
assocA_A = 0;
assocB_B = 0;

symbA = C(1);
symbB = C(2);

%calculating assocAV
for i = 1:N1
    if clusterIdx(i) == symbA
        assocA_V = assocA_V + sum(anAffinityMat(i,:));
    end
end

%calculating assocBV
for i = 1:N1
    if clusterIdx(i) == symbB
        assocB_V = assocB_V + sum(anAffinityMat(i,:));
    end
end

%calculating assocAA
for i = 1:N1
    for j = 1:N2
        if clusterIdx(i) == symbA && clusterIdx(j) == symbA
            assocA_A = assocA_A + anAffinityMat(i,j);
        end
        
    end
end

%calculating assocBB
for i = 1:N1
    for j = 1:N2
        if clusterIdx(i) == symbB && clusterIdx(j) == symbB
            assocB_B = assocB_B + anAffinityMat(i,j);
        end
        
    end
end

nCutValue = 2 - (assocA_A/assocA_V) - (assocB_B/assocB_V);



end

