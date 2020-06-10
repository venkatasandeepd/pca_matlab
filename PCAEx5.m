clear all;clf;
load pcadata.mat;
figure(1);
plot(X(:,1), X(:,2), 'bo');
axis([0 7 2 8]);
title("Datapoints and their 2 principal components");

[Xmu, mu] = subtractMean(X);
[U, S] = myPCA(Xmu);
S = diag(S);
[~, idx_S] = sort(S, 'descend');
U = U(:,idx_S);
line([mu(1)+U(1,1), mu(1)],[mu(2)-U(1,2), mu(2)], "Color", "red",'LineWidth',2);
line([mu(1), mu(1)-U(2,1)],[mu(2), mu(2)+U(2,2)], "Color", "green", 'LineWidth',2);

Z = projectData(Xmu, U, 1);
disp(Z(1:3, :));
X_rec = recoverData(Z,U,1,mu);
figure(2);
hold on;
plot(X(:,1), X(:,2), 'bo');
axis([0 7 2 8]);
plot(X_rec(:,1), X_rec(:,2), 'r*');
title("Datapoints and their reconstruction");

load pcafaces.mat;
figure(3);
displayData(X(1:100, :));
[Xmu, mu] = subtractMean(X);
[U, S] = myPCA(Xmu);
S = diag(S);
[~, idx_S] = sort(S, 'descend');
U = U(:,idx_S);

Z = projectData(Xmu, U, 200);
X_rec = recoverData(Z,U,200,mu);

figure(4);
figure(4);
subplot(1,2,1);
displayData(X(1:100, :));
title("Original faces");
subplot(1,2,2);
displayData(X_rec(1:100, :));
title("Recovered faces");