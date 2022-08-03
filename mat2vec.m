function [vec] = mat2vec(A)
    B = A.';
    vec = B(:);
end
