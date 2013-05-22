function [Xi S] = getRandomSamples(params)

    [Xi S] = getInputs(params);

    subset = randperm(size(Xi, 1))(1 : params.inputSamples);

    Xi = Xi(subset);
    S = S(subset);
end

