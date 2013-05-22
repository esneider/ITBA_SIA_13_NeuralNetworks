function data = initialize(arch, params, Xi, S)

    % Load from file

    if isfield(params, 'file')

        load(params.file, '-mat', 'data');
        return;
    end

    data = struct();

    % Default constants

    data.const = struct();
    data.const.maxEpochs = 1000;
    data.const.epochsPerDump = 100;
    data.const.rollback = true;

    data.const.bias = 0.5;         % TEST: [-0.5 : 0.5 : 0.5]             3
    data.const.beta = 0.5;         % TEST: [0.5 : 0.25 : 1]               3
    data.const.momentum = 0.5;     % TEST: [0 : 0.2 : 1]                  6
    data.const.eta = 0.25;         % TEST: [0 : 0.2 : 1]                  6
    data.const.etaEps = 0.001;     % TEST: [0.0001, 0.001, 0.01, 0.1, 1]  5
    data.const.etaInc = 0.01;      % TEST: [0.0001, 0.001, 0.01, 0.1, 1]  5
    data.const.etaDec = 0.01;      % TEST: [0.0001, 0.001, 0.01, 0.1, 1]  5
    data.const.etaSteps = 3;       % TEST: [2, 3, 4, 5]                   4
    data.const.inputSamples = 100; % TEST: [100, 200, 400]                3
    data.const.inputDim = 2;       % TEST: [2, 3]                         2

    data.const.path = '';

    data.const.g = @functions.sigmoidLog; % TEST: [log, tanh]             2
    data.const.dg = @functions.DsigmoidLog;

    % Get input params

    names = fieldnames(params);
    for i = 1 : length(names)
        data.const.(names{i}) = params.(names{i});
    end

    % Fix beta to functions

    data.fun = struct();
    data.fun.g = @(x)data.const.g(data.const.beta, x);
    data.fun.dg = @(x)data.const.dg(data.const.beta, x);

    % Input

    data.in = struct();
    data.in.arch = [size(Xi, 2) arch size(S, 2)];

    if nargin == 2 % File series

        inputs = algorithm.input.getInputs(params);
        samples = algorithm.input.getRandomSamples(params);

        if data.const.g == @functions.sigmoidTanh
            inputs = inputs * 2 - 1;
            samples = samples * 2 - 1;
        end

        [data.in.allXi, data.in.allS] = inputs;
        [data.in.Xi, data.in.S] = samples;

    else % Manual input test

        data.in.allXi = data.in.Xi = Xi;
        data.in.allS  = data.in.S  = S;
    end

    % Algorithm variables

    data.alg = struct();
    data.alg.M = length(data.in.arch); % Number of layers
    data.alg.W = cell(data.alg.M, 1); % Weights
    data.alg.V = cell(data.alg.M, 1); % Outputs
    data.alg.h = cell(data.alg.M, 1);
    data.alg.dW = cell(data.alg.M, 1); % Delta Weights

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

    data.alg.epoch = 0;
    data.alg.momentum = data.const.momentum;

    % Adaptative eta

    data.alg.eta = data.const.eta;
    data.alg.goodSteps = 0;
    data.alg.rollbacks = 0;
    data.alg.lastError = -1;

    % Status information for plotting

    data.info = struct();
    data.info.sampleErrors = [];
    data.info.globalErrors = [];
    data.info.etas = [];
    data.info.rollbacks = [];
end

