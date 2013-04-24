function data = evalNetwork(input, data)

    data.alg.V{1}(2 : end) = data.in.Xi(input, :)';

    for m = 2 : data.alg.M

        data.alg.h{m} = data.alg.W{m} * data.alg.V{m - 1};

        data.alg.V{m}(2 : end) = data.fun.g(data.alg.h{m});
    end

    data.alg.errorForInputs(input) = sum((data.in.S(input, :)' - data.alg.V{end}(2 : end)) .^ 2);
end

