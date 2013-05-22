function error = getGlobalError(data, useAllInputs)

    if useAllInputs

        data.in.Xi = data.in.allXi;
        data.in.S  = data.in.allS;
    end

    errors = [];

    for input = 1 : size(data.in.Xi, 1)

        data = algorithm.evalNetwork(input, data);

        errors = [errors; algorithm.getError(input, data)];
    end

    error = mean(errors .^ 2);
end

