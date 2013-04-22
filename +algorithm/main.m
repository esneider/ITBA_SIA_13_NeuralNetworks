% 1; % script file

function main(Xi, S, arch)

    data = algorithm.init(Xi, S, arch);

    for run = 1 : data.const.runs

        for input = 1 : size(data.in.Xi, 1)

            data = algorithm.evalNetwork(input, data);
            data = algorithm.backPropagate(input, data);
        end

    end

    % algorithm.debugData(data);

    for input = 1 : size(data.in.Xi, 1)

        data = algorithm.evalNetwork(input, data);

        disp(data.in.Xi(input,:));
        disp(data.alg.V{data.alg.M}(2 : end));
    end

end

