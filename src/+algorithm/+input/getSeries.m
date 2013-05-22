function series = getSeries()

    load('+algorithm/+input/+series/TimeSerie_G3.mat', 'x');

    % Make column vector
    x = x(:);

    % Standarize
    % x = (x - mean(x)) / std(x);

    % Proyect to [0, 1]
    m = min(x);
    M = max(x);
    x = (x - m) / (M - m);

    series = x;
end

