function finalize(data)

    algorithm.debug.printData(data, false);

    fprintf('Eval inputs:\n');

    for input = 1 : size(data.in.Xi, 1)

        data = algorithm.evalNetwork(input, data);

        fprintf('%s = %s\n', mat2str(data.in.Xi(input, :)), mat2str(data.alg.V{end}(2 : end)));
    end

    algorithm.debug.dump2file(data, true);

    close(data.debug.video);
end

