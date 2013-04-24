function series = getSeries()

    load('+algorithm/+input/TimeSerie_G3.mat', 'x');

    series = (x - mean(x)) / std(x);
end
