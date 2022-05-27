function [Seg, Id, Ncut] = NcutRepeat1(affinityMatD, I, T2 ,T1, id)


clusterIdx1 = myGraphSpectralClustering(affinityMatD, 2);

x = unique(clusterIdx1);
count1 = sum(clusterIdx1 == x(1));
count2 = sum(clusterIdx1 == x(2));

A = find(clusterIdx1 == x(1));

B = find(clusterIdx1 == x(2));

nCutValue1 = calculateNcut(affinityMatD , clusterIdx1);
disp(nCutValue1);
if (count1 < T1 || count2 < T1) || nCutValue1 > T2
    Seg{1}   = I;
 
    Id{1}   = id; % for debugging
    Ncut{1} = nCutValue1; % for duebuggin
    return;
end



[SegA, IdA, NcutA] = NcutRepeat1(affinityMatD(A,A), I(A), T2, T1, [id '-A']);

[SegB, IdB, NcutB] = NcutRepeat1(affinityMatD(B,B), I(B), T2, T1, [id '-B']);

Seg = [SegA SegB];
Id = [IdA IdB];
Ncut = [NcutA NcutB];

end

