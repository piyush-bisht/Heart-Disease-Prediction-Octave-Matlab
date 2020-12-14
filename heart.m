clc;
fprintf("--------------WELCOME TO THE HEART DISEASE PREDICTOR---------------\n");
data=csvread('data.csv');
figure(1);
plot(data(:,15));
ylabel("TenYearCHD Present/Absent");
xlabel("i th patient");
hold on;

[posind,pos]=find(data(:,15)==1);
figure(2);
hist(data(:,15));
xlim([0 1 ]);
xlabel("CHD Present/Absent");
ylabel("Count ");
hold on;

m=size(data,1);
%[bias(1),sex,age,cigsPerDay,totChol,sysBP,glucose]
X=[data(2:m,1),data(2:m,2),data(2:m,4),data(2:m,9),data(2:m,10),data(2:m,14)];
p=size(X,2);
size(X);
y=[data(2:m,15)];
m=m-1;
%-------------------------FSCALING----------------------------------------
features_to_be_scaled=X(:,2:p);
[features_to_be_scaled,diff_matrix]=featureScaling(features_to_be_scaled,size(features_to_be_scaled,1),size(features_to_be_scaled,2));
X=[X(:,1) features_to_be_scaled];

%-------------------------Test Train Split---------------------------------
X=[ones(m,1) X];
n=floor(0.7*m);
X_train=[X(1:n,:)];
y_train=[y(1:n,:)];
X_test=[X(n+1:m,:)];
y_test=[y(n+1:m,:)];
fprintf(['Train set size: %i %i\n'],size(X_train));

fprintf(['Test set size: %i %i\n'],size(X_test));

%------------------------Modelling Data----------------------------------------

initial_theta = zeros(p+1, 1);
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[cost, grad] = costFunction(initial_theta, X_train, y_train);
fprintf('\nCost at test theta: %f \n', cost);
fprintf('Gradient at test theta: \n');
fprintf(' %f \n', grad);


[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X_train, y_train)), initial_theta, options);

% Print theta to screen
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);



%------------------------Predicting and Accuracy---------------------------------------


p = predict(theta, X_test);
fprintf('\nTrain Accuracy: %f\n', mean(double(p == y_test)) * 100);
plotConfusion(p,y_test);




