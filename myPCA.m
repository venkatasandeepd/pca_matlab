function [V D] = myPCA(data)
    cmat = cov(data);
    [V,D] = eig(cmat);
end