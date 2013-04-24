function main(Xi, S, arch, params)

    data = algorithm.initialize(Xi, S, arch, params);

    while data.alg.runs < data.const.runs

        data.alg.runs = data.alg.runs + 1;

        data = algorithm.addInputNoise(data);

        for input = 1 : size(data.in.Xi, 1)

            data = algorithm.evalNetwork(input, data);
            data = algorithm.backPropagate(input, data);
        end

        data = algorithm.adaptativeEta(data);

        if (data.alg.errors(end) < data.const.finish)
            break;
        end

        % Debug

        if (~isempty(data.const.debug) && mod(data.alg.runs, 3) == 0)

            data = algorithm.debug.debugRegion(data);
        end

        if (mod(data.alg.runs, data.const.pps) == 0)

            algorithm.debug.dump2file(data, false);
        end

        algorithm.debug.printProgress(data);
    end

    algorithm.finalize(data);
end

