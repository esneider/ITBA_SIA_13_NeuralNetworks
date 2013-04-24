function [Xi S] = getInputs(params)

    series = algorithm.input.getSeries();

    dim = params.inputDim;
    samples = params.inputSamples;
    num = length(series);

    subvectors = randperm(num - dim);
    subvectors = subvectors(1 : samples);

    inputs = [];

    for i = 0 : dim
        inputs = [inputs series(subvectors + i)'];
    end

    Xi = inputs(:, 1 : end - 1);
    S = inputs(:, end);
end
