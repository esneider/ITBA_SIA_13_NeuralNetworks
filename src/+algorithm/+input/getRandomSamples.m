function [Xi S] = getRandomSamples(data)

    [Xi S] = algorithm.input.getInputs(data);

    subset = randperm(size(Xi, 1));
    subset = subset(1 : data.const.inputSamples);

    Xi = Xi(subset, :);
    S = S(subset, :);
end

