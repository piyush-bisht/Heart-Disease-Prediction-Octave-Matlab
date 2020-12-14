function [J, grad] = costFunction(theta, X, y)

%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

z=X*theta;
h=sigmoid(z);
sum=0;
for i=1:m,
    sum=sum+y(i)*log(h(i))+(1-y(i))*log(1-h(i));
    end;
J=-sum/m;

for j=1:length(theta),
    sum=0;
    for i=1:m,
        sum=sum+(h(i)-y(i))*X(i,j);
        end;
    grad(j)=sum/m;
    end;
end
