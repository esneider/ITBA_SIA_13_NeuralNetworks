function data = init(Xi, S, arch)

    data = struct();

    % Constants

    data.const = struct();
    data.const.bias = 0.5;
    data.const.runs = 1000;
    data.const.eta = 0.25;
    data.const.momentum = 0.9;
    data.const.beta = 0.5;

    data.fun = struct();
    data.fun.g = @(x)functions.sigmoid(data.const.beta, x);
    data.fun.dg = @(x)functions.d_sigmoid(data.const.beta, x);

    % Input

    data.in = struct();
    data.in.S = S;
    data.in.Xi = Xi;
    data.in.arch = [size(Xi, 2) arch size(S, 2)];

    % Algorithm variables

    data.alg = struct();
    data.alg.M = length(data.in.arch);
    data.alg.W = cell(1, data.alg.M);
    data.alg.V = cell(1, data.alg.M);
    data.alg.h = cell(1, data.alg.M);
    data.alg.dW = cell(1, data.alg.M);

    for m = 1 : data.alg.M

        curDim = data.in.arch(m);

        if m > 1

            oldDim = data.in.arch(m - 1);

            data.alg.W{m} = 0.1 / sqrt(oldDim) .* ones(curDim, oldDim + 1);
            % data.alg.W{m}(:, 1) = data.const.bias;
            % TODO: add random noise

            data.alg.dW{m} = zeros(curDim, oldDim + 1);
        end

        data.alg.V{m} = [-1; zeros(curDim, 1)];
        data.alg.h{m} = zeros(curDim, 1);
    end

end

