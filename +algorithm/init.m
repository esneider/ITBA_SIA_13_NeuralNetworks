function data = init(Xi, S, arch)

    data = struct();

    % Input

    data.in = struct();
    data.in.S = S;
    data.in.Xi = Xi;
    data.in.arch = [size(Xi, 2) arch size(S, 2)];

    % Constants

    data.const = struct();
    data.const.bias = 0.5;
    data.const.runs = 10000;
    data.const.eta = 0.25;
    data.const.momentum = 0.9;

    data.fun = struct();
    data.fun.g = @functions.sigmoid;
    data.fun.dg = @functions.d_sigmoid;

    % Problem constants

    data.max = struct();
    data.max.M = length(data.in.arch);
    data.max.I = max(data.in.arch);

    % Algorithm variables

    data.alg = struct();
    data.alg.W = cell(1, data.max.M);
    data.alg.V = cell(1, data.max.M);
    data.alg.h = cell(1, data.max.M);
    data.alg.delta = cell(1, data.max.M);
    data.alg.dW = cell(1, data.max.M);

    for m = 2 : data.max.M

        old_I = data.in.arch(m - 1);
        cur_I = data.in.arch(m);

        % TODO: add random noise
        data.alg.W{m} = repmat(0.1 / sqrt(old_I), cur_I, old_I + 1);
        % data.alg.W{m}(:, 1) = data.const.bias;

        data.alg.V{m} = [-1 zeros(1, cur_I)];
        data.alg.h{m} = zeros(1, cur_I + 1);
        data.alg.delta{m} = zeros(1, cur_I + 1);
        data.alg.dW{m} = zeros(cur_I, old_I + 1);
    end

end

