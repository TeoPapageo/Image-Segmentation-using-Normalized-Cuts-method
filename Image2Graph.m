function [myAffinitytMat] = Image2Graph(imIn)

%storing the sizes of the image and the channels ~3 for RGB/1 for grayscale
[X, Y, channels] = size(imIn);

%creating the affinity matrix
myAffinitytMat = zeros((X*Y),(X*Y));

%we get the size of the affinity matrix, which is (NxM)x(NxM)
[X1, Y1] = size(myAffinitytMat);


imIn = reshape(imIn, X*Y, 1, channels);

for i = 1 : X1
    for j = 1:Y1
        
        A = zeros(1,channels);
        B = zeros(1,channels);
        for n = 1:channels
           A(n,1) = imIn(i,1,n);
           B(n,1) = imIn(j,1,n);        

        end        
    
    d = norm(A - B);
    myAffinitytMat(i,j) = 1/exp(d);    
    end
end



end

