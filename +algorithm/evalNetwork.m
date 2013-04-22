function data = evalNetwork(input, data)

    data.alg.V{1} = [-1 data.in.Xi(input, :)];

    for m = 2 : data.max.M

        data.alg.h{m} = data.alg.W{m} * data.alg.V{m - 1}';

        data.alg.V{m}(2 : end) = data.fun.g(data.alg.h{m});
    end
end
