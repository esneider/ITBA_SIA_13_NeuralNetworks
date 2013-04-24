function printProgress(data)

    N = data.alg.runs;
    numN = data.const.runs;

    if (N == 1)
        fprintf('0');
    end

    if (mod(N * 40, numN) < 40)

        if (mod(N * 10, numN) < 10)

            fprintf('%d', floor(N * 10 / numN) * 10);
        else
            fprintf('.');
        end
    end

    if (N == numN)
        fprintf(' - done');
    end
end
