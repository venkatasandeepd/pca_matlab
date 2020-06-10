function [Xmu, mu] = subtractMean(data)
    mu = mean(data);
    Xmu = data - mu;
end