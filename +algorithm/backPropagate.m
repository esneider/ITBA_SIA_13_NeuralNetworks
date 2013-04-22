function data = backPropagate(input, data)

    % TODO: remove delta matrix from data

    M = data.max.M;

    data.alg.delta{M}(2:end) = data.fun.dg(data.alg.h{M})' .* (data.in.S(input, :) - data.alg.V{M}(2:end));

    for m = M : -1 : 3
        data.alg.delta{m - 1}(2:end) = data.fun.dg(data.alg.h{m - 1}) .* (data.alg.delta{m}(2:end) * data.alg.W{m}(:, 2:end))';
    end

    % TODO: adaptative eta

    for m = 2 : M
        data.alg.dW{m} = data.const.momentum * data.alg.dW{m} + data.const.eta * data.alg.delta{m}(2:end)' * data.alg.V{m - 1};
        data.alg.W{m} = data.alg.W{m} + data.alg.dW{m};
    end
end
