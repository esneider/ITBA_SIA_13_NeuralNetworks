function data = backPropagate(input, data)

    % TODO: adaptative eta

    M = data.alg.M;

    delta = data.fun.dg(data.alg.h{M}) .* (data.in.S(input, :)' - data.alg.V{M}(2 : end));

    for m = M : -1 : 2

        momentum = data.const.momentum * data.alg.dW{m};

        data.alg.dW{m} = momentum + data.const.eta * delta * data.alg.V{m - 1}';

        data.alg.W{m} = data.alg.W{m} + data.alg.dW{m};

        delta = data.fun.dg(data.alg.h{m - 1}) .* (data.alg.W{m}(:, 2 : end)' * delta);
    end

end
