function [Xi S] = getInputs(data)

    series = algorithm.input.getSeries();

    dim = data.const.inputDim + 1;

    inputs = [];

    for i = 1 : dim
        inputs = [inputs series(i : end - dim + i)];
    end

    if data.fun.g(-1) < 0
        inputs = inputs * 2 - 1;
    end

    Xi = inputs(:, 1 : end - 1);
    S = inputs(:, end);
end

