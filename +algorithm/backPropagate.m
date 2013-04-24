function data = backPropagate(input, data)

    delta = data.fun.dg(data.alg.h{end}) .* (data.in.S(input, :)' - data.alg.V{end}(2 : end));

    for m = data.alg.M : -1 : 2

        momentum = data.alg.momentum * data.alg.dW{m};

        data.alg.dW{m} = momentum + data.alg.eta * delta * data.alg.V{m - 1}';

        data.alg.W{m} = data.alg.W{m} + data.alg.dW{m};

        delta = data.fun.dg(data.alg.h{m - 1}) .* (data.alg.W{m}(:, 2 : end)' * delta);
    end

end

