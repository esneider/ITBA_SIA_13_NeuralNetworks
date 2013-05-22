params = struct('maxEpochs', 199);

i = 80;

for eta = 0 : 0.2 : 1

    params.eta = eta;
    i = i + 1;
    params.path = strcat('output', int2str(i), '/');
    algorithm.main([4 4], params);
end

