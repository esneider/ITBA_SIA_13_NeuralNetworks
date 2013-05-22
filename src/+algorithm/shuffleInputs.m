function data = shuffleInputs(data)

    indexes = randperm(size(data.in.Xi, 1));

    data.in.Xi = data.in.Xi(indexes, :);
    data.in.S  = data.in.S(indexes, :);
end

