function main(arch, params, Xi, S)

    data = algorithm.initialize(arch, params, Xi, S);

    while data.alg.epoch < data.const.maxEpochs

        data.alg.epoch = data.alg.epoch + 1;

        data = algorithm.shuffleInputs(data);

        for input = 1 : size(data.in.Xi, 1)

            data = algorithm.evalNetwork(input, data);
            data = algorithm.backPropagate(input, data);
            data = algorithm.adaptativeEta(data);
        end

        data = algorithm.collectStatusInfo(data);

        if mod(data.alg.epoch, data.const.epochsPerDump) == 0

            algorithm.debug.dump2file(data);
        end

        algorithm.debug.printProgress(data);
    end

    algorithm.debug.dump2file(data);
end

