function array=Insertion(test1)

    n=numel(test1);
    
    I=randsample(n,2);
    
    j=I(1);
    k=I(2);
    test1 = test1';
    if j<k
        array=test1([1:j-1 j+1:k j k+1:end]);
    else
        array=test1([1:k-1 j k:j-1 j+1:end]);
    end

    array = array';
end