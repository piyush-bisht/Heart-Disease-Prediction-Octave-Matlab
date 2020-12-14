function [featureNormalize,diff_matrix]=featureScaling(X,m,n)
    max_matrix=max(X,[],1);
    min_matrix=min(X,[],1);
    diff_matrix=max_matrix-min_matrix;
    for i=1:n
        featureNormalize(:,i)=X(:,i)./diff_matrix(i);
    end
end
