function totalError(file)

    load(file, 'data');

    series = algorithm.input.getSeries();

    dim = size(data.in.Xi, 2) + 1;
    num = length(series);

    subvectors = [1 : num - dim];

    inputs = [];

    for i = 0 : dim - 1
        inputs = [inputs series(subvectors + i)'];
    end

    data.in.Xi = inputs(:, 1 : end - 1);
    data.in.S = inputs(:, end);

    errors1 = [];
    errors2 = [];

    for input = 1 : size(data.in.Xi, 1)

        data.alg.errors = [];

        data.alg.V{1}(2 : end) = data.in.Xi(input, :)';

        for m = 2 : data.alg.M

            data.alg.h{m} = data.alg.W{m} * data.alg.V{m - 1};

            data.alg.V{m}(2 : end) = data.fun.g(data.alg.h{m});
        end

        errors1 = [errors1 ; sum((data.in.S(input, :)' - data.alg.V{end}(2 : end)) .^ 2)];
        errors2 = [errors2 ; norm(data.in.S(input, :)' - data.alg.V{end}(2 : end))];
    end

    err1 = 0.5 * sum(errors1);
    err2 = mean(errors2);

    fprintf('sum((S - O)^2) = ');
    disp(err1);

    fprintf('mean(norm(S - O)) = ');
    disp(err2);
end

