params = struct('maxEpochs', 199);

i = 20;

for momentum = 0 : 0.2 : 1

    params.momentum = momentum;
    i = i + 1;
    params.path = strcat('output', int2str(i), '/');
    algorithm.main([4 4], params);
end

