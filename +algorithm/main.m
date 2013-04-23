% 1; % script file

function main(Xi, S, arch, params)

    data = algorithm.initialize(Xi, S, arch, params);

    for run = 1 : data.const.runs

        for input = 1 : size(data.in.Xi, 1)

            data = algorithm.evalNetwork(input, data);
            data = algorithm.backPropagate(input, data);
        end

        if (length(data.const.debug))

            data = algorithm.debug.debugRegion(data);
        end
    end

    close(data.debug.video);

    algorithm.debug.debugData(data);

    for input = 1 : size(data.in.Xi, 1)

        data = algorithm.evalNetwork(input, data);

        disp(data.in.Xi(input,:));
        disp(data.alg.V{data.alg.M}(2 : end));
    end

    algorithm.debug.plotRegion(data);
end

