function data = initialize(Xi, S, arch, params)

    data = struct();

    % Default constants

    data.const = struct();
    data.const.bias = 0.5;
    data.const.runs = 1000;
    data.const.eta = 0.25;
    data.const.momentum = 0.9;
    data.const.beta = 0.5;
    data.const.debug = '';
    data.const.g = @functions.sigmoidLog;
    data.const.dg = @functions.DsigmoidLog;

    names = fieldnames(params);
    for i = [1 : length(names)]
        data.const.(names{i}) = params.(names{i});
    end

    data.fun = struct();
    data.fun.g = @(x)data.const.g(data.const.beta, x);
    data.fun.dg = @(x)data.const.dg(data.const.beta, x);

    % Input

    data.in = struct();
    data.in.S = S;
    data.in.Xi = Xi;
    data.in.arch = [size(Xi, 2) arch size(S, 2)];

    % Algorithm variables

    data.alg = struct();
    data.alg.M = length(data.in.arch);
    data.alg.W = cell(data.alg.M, 1);
    data.alg.V = cell(data.alg.M, 1);
    data.alg.h = cell(data.alg.M, 1);
    data.alg.dW = cell(data.alg.M, 1);

    for m = 1 : data.alg.M

        curDim = data.in.arch(m);

        if m > 1

            oldDim = data.in.arch(m - 1) + 1;

            data.alg.W{m} = 2 / sqrt(oldDim) .* (rand(curDim, oldDim) - 0.5);

            data.alg.W{m}(:, 1) = data.const.bias;

            data.alg.dW{m} = zeros(curDim, oldDim);
        end

        data.alg.V{m} = [-1; zeros(curDim, 1)];
        data.alg.h{m} = zeros(curDim, 1);
    end

    % Debug variables

    data.debug = struct();
    data.debug.video = 'all';

end

