function [Xi S] = getInputs(params)

    series = algorithm.input.getSeries();

    dim = params.inputDim + 1;

    inputs = []

    for i = 1 : dim + 1
        inputs = [inputs series(i : end - dim + i)]
    end

    Xi = inputs(:, 1 : end - 1);
    S = inputs(:, end);
end

